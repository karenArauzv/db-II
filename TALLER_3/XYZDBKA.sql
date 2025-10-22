
create database xyzDB; 
use xyzDB;

create table perfiles(
	id_perfil int primary key auto_increment,
    nombre_perfil varchar(60),
    fecha_vigencia date, 
    descripcion_perfil text, 
    encargado_perfil int 
    );
    

create table usuarios (
	id_usuario int primary key auto_increment,
    nombre varchar(60),
    apellido varchar(60),
    estado varchar(10),
    contraseña varchar(20), 
    cargo varchar(60), 
    salario decimal(10, 2),
    fecha_ingreso date,
    id_perfil int,
    foreign key (id_perfil) references perfiles(id_perfil)
    );
    

create table login(
	id_login int primary key auto_increment,
    id_usuario int, 
    fecha_hora_login datetime,
    estado_login varchar(10),
    foreign key (id_usuario) references usuarios(id_usuario)
    );
    

create table actividades (
  id_actividad int primary key auto_increment,
  fecha_actividad date,
  tipo_actividad varchar(60),
  descripcion_actividad text,
  puntos_otorgados int
);
    
create table fidelizacion(
	id_fidelizacion int primary key auto_increment,
    id_usuario int, 
    id_actividad int,
    foreign key (id_usuario) references usuarios(id_usuario),
    foreign key (id_actividad) references actividades(id_actividad)
    );	
    
-- Simulación de Datos Mínimo
-- 20 Usuarios 
-- 10 Perfiles diferentes 
-- 100 Registros de autenticación (Login) 
-- Registros de actividades de fidelización para 12 meses (simular al menos 2 actividades por mes) 
-- Calcular la cantidad de puntos de fidelización acumulados por cada usuario en 12 meses. 

insert into perfiles (nombre_perfil, fecha_vigencia, descripcion_perfil) values
('Recursos Humanos', '2025-10-01', 'Gestión del talento y clima laboral'),
('Servicio Técnico', '2024-08-01', 'Mantenimiento y soporte técnico'),
('Planeación Estratégica', '2024-07-01', 'Diseño de estrategias corporativas'),
('Relaciones Públicas', '2024-06-01', 'Imagen institucional y comunicación externa'),
('Auditoría', '2024-04-01', 'Supervisión y control interno'),
('Seguridad y Logística', '2024-03-01', 'Protección física y distribución'),
('Tecnología (TI)', '2024-02-01', 'Infraestructura y desarrollo tecnológico'),
('Marketing y Diseño', '2024-02-01', 'Publicidad, diseño y redes sociales'),
('Finanzas y Contabilidad', '2024-01-01', 'Gestión financiera y contable'),
('Legal y Asesoría', '2024-01-01', 'Asuntos legales y cumplimiento normativo');

insert into usuarios (nombre, apellido, estado, contraseña, cargo, salario, fecha_ingreso, id_perfil) values
('Katherin', 'Espinosa ', 'activo', 'pass1', 'Ejecutiva', 1200.00, '2024-01-15', 1),
('Jake', 'Cameron', 'activo', 'pass2', 'Analista', 1500.00, '2024-11-10', 5),
('Anderson', 'Gonzales', 'activo', 'pass3', 'Técnico', 1100.00, '2024-02-05', 2),
('Clara', 'Villalobos', 'activo', 'pass4', 'Coordinadora', 1800.00, '2025-09-20', 3),
('Michael', 'Rodriguez', 'activo', 'pass5', 'Supervisor', 2000.00, '2024-06-01', 6),
('Maria', 'Garcia', 'activo', 'pass6', 'Diseñadora', 1600.00, '2024-02-12', 8),
('Roberto', 'Perez', 'activo', 'pass7', 'Contador', 1700.00, '2025-12-01', 9),
('Alanys', 'Villareal', 'activo', 'pass8', 'Abogada', 2100.00, '2024-04-18', 10),
('Fernando', 'Pimentel', 'activo', 'pass9', 'Logístico', 1400.00, '2024-05-10', 6),
('Sofia', 'Ríos', 'activo', 'pass10', 'Agente de RRPP', 1300.00, '2024-07-22', 4),
('Simon', 'Valdes', 'activo', 'pass11', 'Ejecutivo', 1250.00, '2024-01-20', 1),
('Isabel', 'Orozco', 'activo', 'pass12', 'Analista de procesos', 1550.00, '2024-10-15', 3),
('Ricardo', 'Arjona', 'activo', 'pass13', 'Técnico de campo', 1150.00, '2024-03-10', 2),
('Rosa', 'Ramos', 'activo', 'pass14', 'Coordinadora de proyectos', 1850.00, '2024-08-25', 3),
('Tomas', 'Alonso', 'activo', 'pass15', 'Supervisor de seguridad', 2050.00, '2024-06-15', 6),
('Yisel', 'Valdes', 'activo', 'pass16', 'Diseñadora gráfica', 1650.00, '2024-02-18', 8),
('Sebastián', 'Gonzales', 'activo', 'pass17', 'Contador senior', 1750.00, '2025-11-30', 9),
('Aurora', 'Julio', 'activo', 'pass18', 'Asesora legal', 2150.00, '2024-04-25', 10),
('Luis', 'Valencia', 'activo', 'pass19', 'Coordinador logístico', 1450.00, '2024-05-15', 6),
('Taylor', 'Martinez', 'activo', 'pass20', 'Agente de marketing', 1350.00, '2024-07-28', 8);


insert actividades (fecha_actividad, tipo_actividad, descripcion_actividad, puntos_otorgados) values
-- 1
('2024-01-05', 'Taller', 'Liderazgo personal', 90),
('2024-01-20', 'Evento', 'Fiesta de integración', 80),
-- 2
('2024-02-10', 'Taller', 'Comunicación efectiva', 100),
('2024-02-25', 'Evento', 'Jornada deportiva', 90),
-- 3
('2024-03-08', 'Taller', 'Gestión del tiempo', 100),
('2024-03-22', 'Evento', 'Voluntariado corporativo', 80),
-- 4
('2024-04-05', 'Taller', 'Trabajo en equipo', 100),
('2024-04-20', 'Evento', 'Concurso de ideas', 120),
-- 5
('2024-05-10', 'Taller', 'Resolución de conflictos', 70),
('2024-05-25', 'Evento', 'Día de la familia', 100),
-- 6
('2024-06-05', 'Taller', 'Pensamiento estratégico', 90),
('2024-06-20', 'Evento', 'Hackathon interno', 80),
-- 7
('2024-07-10', 'Taller', 'Presentaciones efectivas', 100),
('2024-07-25', 'Evento', 'Trivia corporativa', 70),
-- 8
('2024-08-05', 'Taller', 'Gestión emocional', 90),
('2024-08-20', 'Evento', 'Feria de talentos', 80),
-- 9
('2024-09-10', 'Taller', 'Negociación avanzada', 100),
('2024-09-25', 'Evento', 'Cena de agradecimiento', 60),
-- 10
('2024-10-05', 'Taller', 'Innovación estratégica', 100),
('2024-10-20', 'Evento', 'Cine empresarial', 40),
-- 11
('2024-11-10', 'Taller', 'Excel avanzado', 90),
('2024-11-25', 'Evento', 'Torneo interno', 70),
-- 12
('2024-12-05', 'Taller', 'Evaluación anual', 100),
('2024-12-20', 'Evento', 'Fiesta de fin de año', 100);

-- 12 meses del año 2 actividades por mes serian 24 actividades 

insert into fidelizacion (id_usuario, id_actividad) values
(1,1),(1,3),(1,5),(1,7),(1,9),(1,11),(1,13),(1,15),(1,17),(1,19),
(2,2),(2,4),(2,6),(2,8),(2,10),(2,12),(2,14),(2,16),(2,18),(2,20),
(3,1),(3,4),(3,5),(3,8),(3,9),(3,12),(3,13),(3,16),(3,17),(3,20),
(4,2),(4,3),(4,6),(4,7),(4,10),(4,11),(4,14),(4,15),(4,18),(4,19),
(5,1),(5,2),(5,3),(5,4),(5,5),(5,6),(5,7),(5,8),(5,9),(5,10),
(6,1),(6,6),(6,11),(6,16),(6,18),(6,20),
(7,2),(7,7),(7,12),(7,17),(7,19),(7,20),
(8,3),(8,8),(8,13),(8,14),(8,15),(8,16),
(9,4),(9,9),(9,10),(9,11),(9,12),(9,13),
(10,5),(10,6),(10,7),(10,8),(10,9),(10,10),
(11,1),(11,3),(11,5),(11,7),(11,9),(11,11),
(12,2),(12,4),(12,6),(12,8),(12,10),(12,12),
(13,5),(13,10),(13,15),
(14,6),(14,11),(14,16),
(15,7),(15,12),(15,17),
(16,8),(16,13),(16,18),
(17,9),(17,14),(17,19),
(18,10),(18,15),(18,20),
(19,1),(19,6),(19,11),
(20,2),(20,7),(20,12);


insert into login (id_usuario, fecha_hora_login, estado_login)
select u.id_usuario,
       date_add('2024-01-01 08:00:00', interval floor(rand() * 600) day),
       if(rand() > 0.2, 'exitoso', 'fallido')
from usuarios u,
     (select 1 union select 2 union select 3 union select 4 union select 5) as reps;
     
     
select 
  u.id_usuario,
concat(u.nombre, ' ', u.apellido) as nombre_completo,
  sum(a.puntos_otorgados) as puntos_totales
from usuarios u
join fidelizacion f on u.id_usuario = f.id_usuario
join actividades a on f.id_actividad = a.id_actividad
where a.fecha_actividad between '2024-01-01' and '2024-12-31'
group by  u.id_usuario
order by puntos_totales desc;





-- II. parte
--  1. Vista de Desempeño de Colaboradores

create view v_DesempenoColaboradores as
select  
  u.id_usuario,
concat(u.nombre, ' ', u.apellido) as nombre_completo,
  u.cargo,
  u.salario,
  u.fecha_ingreso,
  coalesce(sum(a.puntos_otorgados), 0) as total_puntos_fidelizacion_acumulados,
  round(coalesce(avg(a.puntos_otorgados), 0), 2) as promedio_puntos_por_actividad,
  case
    when sum(a.puntos_otorgados) > 500 then 'Excelente'
    when sum(a.puntos_otorgados) between 200 and 500 then 'Bueno'
    else 'Regular'
  end as estado_fidelizacion,
  datediff(current_date, (
    select max(l.fecha_hora_login)
    from login l
    where l.id_usuario = u.id_usuario and l.estado_login = 'exitoso'
  )) as dias_desde_ultimo_login
from usuarios u
left join fidelizacion f on u.id_usuario = f.id_usuario
left join actividades a on f.id_actividad = a.id_actividad
group by u.id_usuario;


-- 2. Vista de Actividades por Perfil
create view v_actividadesPorPerfil as
select
  p.id_perfil,
  p.nombre_perfil,
  p.descripcion_perfil,
  count(u.id_usuario) as cantidad_usuarios_con_este_perfil,
  count(f.id_fidelizacion) as total_actividades_participadas_por_perfil,
  round(coalesce(sum(a.puntos_otorgados) / count(u.id_usuario), 0), 2) as promedio_puntos_por_usuario_en_este_perfil,
  round(
    (count(f.id_fidelizacion) / (select count(*) from fidelizacion)) * 100,
    2
  ) as porcentaje_participacion_total
from perfiles p
left join usuarios u on p.id_perfil = u.id_perfil
left join fidelizacion f on u.id_usuario = f.id_usuario
left join actividades a on f.id_actividad = a.id_actividad
 group by p.id_perfil;
 
 -- 3. Vista de Historial de Login Detallado
create view v_historialLoginDetallado AS
select 
  u.nombre as nombre_usuario,
  u.apellido as apellido_usuario,
  u.cargo as cargo_usuario,
  l.fecha_hora_login,
  l.estado_login,
  timestampdiff(minute,
    lag(l.fecha_hora_login) over (partition by l.id_usuario order by l.fecha_hora_login),
    l.fecha_hora_login
  ) as tiempo_desde_anterior_login
from login l
join usuarios u on l.id_usuario = u.id_usuario;



-- 4. Uso de Vistas para Escenarios de Negocio: 
-- ¿Cuáles son los 5 colaboradores con mejor desempeño en fidelización en el último trimestre y cuál es su cargo? 
select nombre_completo, cargo, total_puntos_fidelizacion_acumulados
from v_DesempenoColaboradores
where total_puntos_fidelizacion_acumulados > 0
order by total_puntos_fidelizacion_acumulados desc
limit 5;


-- ¿Qué perfiles tienen la menor participación en actividades de fidelización y requieren un plan de incentivos? 
select nombre_perfil, total_actividades_participadas_por_perfil
from v_actividadesPorPerfil
order by total_actividades_participadas_por_perfil asc
limit 3;



-- ¿Qué usuarios no han iniciado sesión en los últimos 30 días y cuál fue su último cargo? 
select nombre_completo, cargo, dias_desde_ultimo_login
from v_DesempenoColaboradores
where dias_desde_ultimo_login > 30;


-- Obtener un reporte mensual de la cantidad de logins exitosos vs. fallidos. 
select
  date_format(fecha_hora_login, '%Y-%m') as mes,
  estado_login,
  count(*) as cantidad
from login
group by mes, estado_login
order by mes;
