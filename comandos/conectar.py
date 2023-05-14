import click
import psycopg2


@click.command()
@click.argument("usuario")
@click.argument("contraseña")
@click.pass_context
def conectar(ctx, usuario, contraseña):
    if ctx.obj["user"] != None:
        click.echo("Ya esta conectado a la base de datos")
        return

    try:
        conn = psycopg2.connect(dbname="test", user=usuario, password=contraseña)
        cur = conn.cursor()
        cur.close()
        conn.close()

        # Si la conexion es correcta se guardan las credenciales
        f = open(".env", "w")
        f.write("DB_USER=" + str(usuario) + "\n")
        f.write("DB_PASS=" + str(contraseña))
        f.close()

        click.secho("Conexión completada con exito", fg="green")

    except Exception as e:
        click.secho(
            "Hubo un error conectandose a la base de datos, por favor revise el usuario y la contraseña",
            fg="red",
        )
        click.echo(e)
