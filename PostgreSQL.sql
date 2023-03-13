DROP TABLE IF EXISTS positions, persons, actors, dubbing_actors, genres, counries, viewers, movie_actors, movie_dubbing_actors, movies ;

CREATE TABLE positions(position_id BIGSERIAL primary key, position_name TEXT not NULL UNIQUE );

CREATE TABLE persons(person_id BIGSERIAL PRIMARY KEY, first_name text, surname TEXT, fk_position_id BIGINT REFERENCES positions(position_id) not NULL);

CREATE TABLE actors(actor_id BIGSERIAL PRIMARY KEY, first_name text not NULL, surname text not NULL);

CREATE TABLE dubbing_actors(dubbing_actor_id BIGSERIAL PRIMARY KEY, first_name text not NULL, surname text not NULL);

CREATE TABLE genres(genre_id SERIAL PRIMARY KEY, genre_name VARCHAR(15) NOT NULL UNIQUE);

CREATE TABLE counries(counry_id SERIAL PRIMARY KEY, counry_name text NOT NULL UNIQUE );

create table movies(movie_id BIGSERIAL PRIMARY KEY, 
                    title TEXT NOT NULL, 
                    subtitle text,
                    cover text,
                    trailer text,
                    raiting real not null,
                    reviews int,
                    product_year DATE not NULL,
                    fk_country int REFERENCES counries(counry_id) NOT NULL,
                    fk_genre int REFERENCES genres(genre_id) NOT NULL,
                    fk_director bigint REFERENCES persons(person_id) NOT NULL,
                    fk_scenario bigint REFERENCES persons(person_id) NOT NULL,
                    fk_producer bigint REFERENCES persons(person_id) NOT NULL,
                    fk_operator bigint REFERENCES persons(person_id ) NOT NULL,
                    fk_composer bigint REFERENCES persons(person_id) NOT NULL,
                    fk_artist bigint REFERENCES persons(person_id) NOT NULL,
                    fk_editing bigint REFERENCES persons(person_id) NOT NULL,
                    budget int NOT NULL,
                    marketing int,
                    us_fees int,
                    world_fees int NOT NULL,
                    premiere_in_russia DATE,
                    world_premiere DATE NOT NULL,
                    age_restriction int NOT NULL,
                    mpaa_raiting varchar(10),
                    oscar_count int);
                    
CREATE TABLE viewers(viewers_id BIGINT PRIMARY KEY,fk_movie_id BIGINT REFERENCES movies(movie_id), fk_counry BIGINT REFERENCES counries(counry_id), view_count int);
                    
CREATE TABLE movie_actors(movie_id bigint REFERENCES movies(movie_id), actor_id bigint REFERENCES actors(actor_id), CONSTRAINT pk_movie_actor PRIMARY key (movie_id, actor_id));

CREATE table movie_dubbing_actors(movie_id bigint REFERENCES movies(movie_id), dubbing_actor_id bigint REFERENCES dubbing_actors(dubbing_actor_id), CONSTRAINT pk_movie_dubbing_actor PRIMARY key (movie_id, dubbing_actor_id));
                                         
