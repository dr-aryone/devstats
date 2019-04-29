update gha_commits c set dup_author_login = (select distinct a.login from gha_actors a, gha_actors_names an where a.id = an.actor_id and an.name = c.author_name) where c.dup_author_login = '' and c.author_name != '' and (select count(distinct a.login) from gha_actors a, gha_actors_names an where a.id = an.actor_id and an.name = c.author_name) = 1;
update gha_commits c set author_id = (select a.id from gha_actors a where a.login = c.dup_author_login order by a.id desc limit 1) where c.dup_author_login != '' and c.author_id is null;
update gha_commits c set author_email = (select ae.email from gha_actors_emails ae where ae.actor_id = c.author_id limit 1) where c.author_email = '' and c.author_id is not null and (select ae.email from gha_actors_emails ae where ae.actor_id = c.author_id limit 1) is not null;
update gha_commits c set dup_author_login = (select a.login from gha_actors a where a.id = c.author_id) where c.dup_author_login = '' and c.author_id is not null;
update gha_commits c set dup_committer_login = (select a.login from gha_actors a where a.id = c.committer_id) where c.dup_committer_login = '' and c.committer_id is not null;
