import click
import psycopg2
import sys
import os
from dotenv import load_dotenv

from comandos.conectar import conectar
from comandos.consultar import consultar


@click.group()
@click.pass_context
def cli(ctx):
    if os.path.exists(".env"):
        # dotenv file in the root directory
        load_dotenv(dotenv_path=".env")

        user = os.getenv("DB_USER")
        password = os.getenv("DB_PASS")
        conn = psycopg2.connect(dbname="test", user=user, password=password)

        ctx.obj["user"] = user
        ctx.obj["password"] = password
        ctx.obj["conn"] = conn

    else:
        if click.get_current_context().invoked_subcommand != "conectar":
            click.echo(
                "Primero debe conectarse a la base de datos, use el comando "
                + click.style("conectar", fg="green"),
            )
            sys.exit()


cli.add_command(conectar)
cli.add_command(consultar)


if __name__ == "__main__":
    cli(obj={"user": None, "password": None})
