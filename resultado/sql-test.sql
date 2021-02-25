
Escribe en SQL para extraer la siguente información

1) Número de pólizas activas

Select count(*) 
From Policies
Where
	Status = ''activa"

2) Listado de todas las campañías activas. Una compañia está activa si al menos hay una poliza activa (company_id)

Select company_id
From Policies
Where 
	Status = ''activa"
Group by company_id
Having count(*)>0

3) Número de compañías activas
 
Select count (distinct company_id)
From Policies
Where 
	Status = ''activa"

4) Numero de siniestros por cada poliza desglosado por tipo de siniestro

Select policy_is as "id (policy)", claim_type, count(*) as count
From Claims
Group bypolicy_is, claim_type

5) Número de siniestros por compañía y por tipo de evento

Select P.company_id, C.claim_type, count(*) as count
From Policies P, Claims C
Where P.id_int = C.id_int
Group P.company_id, C.claim_type
Order by P.company_id ASC, count DESC

6) ¿Cómo crearias la tabla para relacionar usuarios y polizas?

CREATE TABLE Users_Policies (
    id_int int,
    user_name LastName varchar(255),
    policie_name(255)
)

7) Número de polizas por usuario y por estado de la poliza teniendo en cuenta que puedes usar la tabla de la relación anterior

Select U.user_name, P.status, count(*) as Numero_Polizas
From Users_Policies U, Policies P
Where 
       U.id_int = P.id_int;
Group by U.user_name, P.status
Order by U.user_name, P.status, Numero_Polizas

NOTA:  Se podría obtener la consulta sin crear la tabla del punto 6
