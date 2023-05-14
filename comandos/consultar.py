import click
from psycopg2.sql import SQL, Identifier
from tabulate import tabulate


@click.command()
@click.option("--rejilla", default=False, help="Especifica el formato de la tabla")
@click.option("--restriccion", default="true", help="Clausula WHERE")
@click.argument("tabla")
@click.pass_context
def consultar(ctx, rejilla, restriccion, tabla):
    cur = ctx.obj["conn"].cursor()

    # por ahora asi, hay que buscar otra forma para restriccion
    consulta = "SELECT * FROM {} WHERE " + restriccion
    cur.execute(SQL(consulta).format(Identifier(tabla)))
    tabla = tabulate(
        cur.fetchall(),
        headers=[desc[0] for desc in cur.description],
        tablefmt=("grid" if rejilla else ""),
    )
    click.echo(tabla)
