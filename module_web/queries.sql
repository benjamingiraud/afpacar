##obtenir la liste des meetings de l''année 2017
SELECT * FROM meeting WHERE YEAR(meeting.date) = 2017 


##obtenir la liste des participants d''un meeting donné
SELECT athlete.* FROM athlete inner join result on athlete.id = result.id 
WHERE result.meeting_id = 1

## obtenir le classement général de toutes les épreuves de l''année 2017 classé par nombre de points descendant

SELECT SUM(result.points) as total, athlete.lastname, athlete.firstname FROM result inner join athlete on result.athlete_id = athlete.id inner join meeting on result.meeting_id = meeting.id WHERE YEAR(CURRENT_DATE()) = 2017 GROUP BY athlete.id ORDER BY total DESC 


