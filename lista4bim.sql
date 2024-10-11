--1
CREATE VIEW view_alunos_cursos AS
SELECT a.nome AS aluno, d.nome AS disciplina, c.nome AS curso
FROM aluno a
JOIN matricula m ON a.id = m.aluno_id
JOIN turma t ON m.turma_id = t.id
JOIN disciplina d ON t.disciplina_id = d.id
JOIN curso c ON d.curso_id = c.id;


--2

CREATE VIEW view_total_alunos_por_disciplina AS
SELECT d.nome AS disciplina, COUNT(m.id) AS total_alunos
FROM matricula m
JOIN turma t ON m.turma_id = t.id
JOIN disciplina d ON t.disciplina_id = d.id
GROUP BY d.nome;

	
--3
CREATE VIEW view_alunos_status_matricula AS
SELECT a.nome AS aluno, d.nome AS disciplina, m.status
FROM aluno a
JOIN matricula m ON a.id = m.aluno_id
JOIN turma t ON m.turma_id = t.id
JOIN disciplina d ON t.disciplina_id = d.id;

--4

CREATE VIEW view_professores_turmas AS
SELECT p.nome AS professor, d.nome AS disciplina, t.horario
FROM professor p
JOIN turma t ON p.id = t.professor_id
JOIN disciplina d ON t.disciplina_id = d.id;

--5

CREATE VIEW view_alunos_maiores_de_20_anos AS
SELECT nome, data_nascimento
FROM aluno
WHERE EXTRACT(YEAR FROM AGE(data_nascimento)) > 20;

--6

CREATE VIEW view_disciplinas_por_curso AS
SELECT c.nome AS curso, COUNT(d.id) AS total_disciplinas, SUM(t.horario) AS carga_horaria_total
FROM curso c
JOIN disciplina d ON c.id = d.curso_id
JOIN turma t ON d.id = t.disciplina_id
GROUP BY c.nome;

--7

CREATE VIEW view_professores_especialidades AS
SELECT nome, especialidade
FROM professor;

--8

CREATE VIEW view_alunos_mais_de_uma_disciplina AS
SELECT a.nome AS aluno, COUNT(m.id) AS disciplinas_matriculadas
FROM aluno a
JOIN matricula m ON a.id = m.aluno_id
GROUP BY a.nome
HAVING COUNT(m.id) > 1;

--9

CREATE VIEW alunos_disciplinas_concluidas AS
SELECT a.nome AS aluno, COUNT(m.id) AS disciplinas_concluidas
FROM aluno a
JOIN matricula m ON a.id = m.aluno_id
WHERE m.status = 'Concluiu'
GROUP BY a.nome;


--10

CREATE VIEW view_turmas_por_semestre AS
SELECT d.nome AS disciplina, t.semestre, t.horario
FROM turma t
JOIN disciplina d ON t.disciplina_id = d.id
WHERE t.semestre = '2024.1';  -- Alterar o semestre conforme necessário


--11

CREATE VIEW alunos_matriculas_trancadas AS
SELECT a.nome AS aluno
FROM aluno a
JOIN matricula m ON a.id = m.id_aluno
WHERE m.status = 'Trancado';




--  12

CREATE VIEW disciplinas_sem_alunos AS
SELECT d.nome AS disciplina
FROM disciplina d
LEFT JOIN turma t ON d.id = t.disciplina_id
LEFT JOIN matricula m ON t.id = m.turma_id
WHERE m.id IS NULL;

--13

CREATE VIEW view_alunos_por_status AS
SELECT m.status, COUNT(m.id) AS total_alunos
FROM matricula m
GROUP BY m.status;

--14

CREATE VIEW view_total_professores_por_especialidade AS
SELECT especialidade, COUNT(id) AS total_professores
FROM professor
GROUP BY especialidade;

--15

CREATE VIEW view_alunos_idade AS
SELECT nome, EXTRACT(YEAR FROM AGE(data_nascimento)) AS idade
FROM aluno;

	
--16

CREATE VIEW view_alunos_ultimas_matriculas AS
SELECT a.nome AS aluno, MAX(m.id) AS ultima_matricula_id
FROM aluno a
JOIN matricula m ON a.id = m.aluno_id
GROUP BY a.nome;

-- 17

CREATE VIEW view_disciplinas_por_curso_especifico AS
SELECT d.nome AS disciplina
FROM disciplina d
JOIN curso c ON d.curso_id = c.id
WHERE c.nome = 'Engenharia de Software';  -- Alterar o curso conforme necessário

--18	

CREATE VIEW professores_sem_turmas AS
SELECT p.nome AS professor
FROM professor p
LEFT JOIN turma t ON p.id = t.professor_id
WHERE t.id IS NULL;


-- 19 



CREATE VIEW view_alunos_cpf_email AS
SELECT nome, cpf, email
FROM aluno;

	
--20

CREATE VIEW total_disciplinas_por_professor AS
SELECT p.nome AS professor, COUNT(t.id) AS total_disciplinas
FROM professor p
JOIN turma t ON p.id = t.professor_id
GROUP BY p.nome;