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