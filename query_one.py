def q_1():
    return """SELECT
    SUM(CASE WHEN tipo = 1 THEN tipo ELSE 0 END) AS tipo_1,
    SUM(CASE WHEN tipo = 2 THEN tipo ELSE 0 END) AS tipo_2
FROM accion"""


def q_2():
    return """SELECT
	(select nombre from sector s where e.id_sector=s.id),
    count(*)
    FROM empresa e
    group by(e.id_sector)"""

def q_3():
    return """select (select nombre from sector s where e.id_sector=s.id) as sector, sum(a.volumen)
    from accion a 
    inner join empresa e on e.ticker=a.ticker
    group by sector"""


def q_4():
        return """SELECT
	(select nombre from sector s where e.id_sector=s.id),
    count(*)
    FROM empresa e
    where e.ticker in(select ticker from accion where valor_actual >1000)
    group by(e.id_sector)"""
