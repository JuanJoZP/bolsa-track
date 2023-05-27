import dash
from dash import dcc as dcc
from dash import html as html
import plotly.express as px
import pandas as pd
import psycopg2
import query_one as sql
import plotly.graph_objects as go


class Connection:
    def __init__(self):
        self.connection = None
    def openConnection(self):
        try:
            self.connection = psycopg2.connect(user = "postgres",
                                               password = "1234",
                                               database = "bolsa-track",
                                               host = "localhost",
                                               port = "5432")
        except Exception as e:
            print(e)
    def closeConnection(self):
        self.connection.close()

    
external_stylesheets = ["https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"]

app = dash.Dash(__name__, external_stylesheets = external_stylesheets)

con = Connection()
con.openConnection()
query = pd.read_sql_query(sql.q_1(),con.connection)
query_2= pd.read_sql_query(sql.q_2(),con.connection)
query_3 = pd.read_sql_query(sql.q_3(),con.connection)
query_4= pd.read_sql_query(sql.q_4(),con.connection)
con.closeConnection()


query.columns = ["Blue chips", "Penny stocks"]
query_2.columns = ["Sector", "Cantidad_empresas"]
query_3.columns = ["Sector", "Volumen de acciones"]
query_4.columns = ["Sector","Cantidad_empresas"]

fig1 = go.Figure(data=[go.Pie(labels=query.columns, values=query.values[0])])
fig2 = go.Figure(data=go.Bar(x=query_2['Sector'], y=query_2['Cantidad_empresas']))
fig3 = go.Figure(data=go.Bar(x=query_4['Sector'], y=query_4['Cantidad_empresas']))
fig4 = go.Figure(data=go.Bar(x=query_3['Sector'], y=query_3['Volumen de acciones']))


app.layout = html.Div(children=[
    html.Div(
    style={"display": "grid", "grid-auto-flow":"column", "grid-gap" : "10px", "background-color": "#fff", "color": "444", 'textAlign': 'center'},  # Aplica el estilo de centrado al contenedor Div
    children=[
        html.Div(
            children=[
                html.H1('Diagrama de Torta'),  # El H1 se centrará dentro del contenedor Div
                dcc.Graph(id = 'Acciones', figure = fig1),
            ]
        ),
        html.Div(
            children=[
                html.H1('Diagrama de barras'),  # El H1 se centrará dentro del contenedor Div
                dcc.Graph(id = 'Sectores', figure = fig2),
            ]
        ),html.Div(
            children=[
                html.H1('Diagrama de barras'),  # El H1 se centrará dentro del contenedor Div
                dcc.Graph(id = 'Empresas grandes Acciones', figure = fig3),
            ]
        ),
        html.Div(
            children=[
                html.H1('Diagrama de burbujas'),  # El H1 se centrará dentro del contenedor Div
                dcc.Graph(id = 'Variacion', figure = fig4),
            ]
        ),
        
    ]),
])


if __name__ == '__main__':
   app.run_server(debug=True)


if __name__ == '__main__':
   app.run_server(debug=True)


    
