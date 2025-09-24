

CREATE TABLE actor (
    act_id INTEGER IDENTITY(1,1) PRIMARY KEY,
    act_fname NVARCHAR(20),
    act_lname NVARCHAR(20),
    act_gender NCHAR(1)
);

CREATE TABLE director (
    dir_id INTEGER IDENTITY(1,1) PRIMARY KEY,
    dir_fname NVARCHAR(20),
    dir_lname NVARCHAR(20)
);

CREATE TABLE genres (
    gen_id INTEGER IDENTITY(1,1) PRIMARY KEY,
    gen_title NVARCHAR(20)
);

CREATE TABLE reviewer (
    rev_id INTEGER IDENTITY(1,1) PRIMARY KEY,
    rev_name NVARCHAR(30)
);

CREATE TABLE movie (
    mov_id INTEGER IDENTITY(1,1) PRIMARY KEY,
    mov_title NVARCHAR(50),
    mov_year INTEGER,
    mov_time INTEGER,
    mov_lang NVARCHAR(50),
    mov_dt_rel DATE,
    mov_rel_country NVARCHAR(5)
);

CREATE TABLE movie_cast (
    act_id INTEGER,
    mov_id INTEGER,
    role NVARCHAR(30),
    PRIMARY KEY (act_id, mov_id),
    FOREIGN KEY (act_id) REFERENCES actor(act_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);

CREATE TABLE movie_direction (
    dir_id INTEGER,
    mov_id INTEGER,
    PRIMARY KEY (dir_id, mov_id),
    FOREIGN KEY (dir_id) REFERENCES director(dir_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);

CREATE TABLE movie_genres (
    mov_id INTEGER,
    gen_id INTEGER,
    PRIMARY KEY (mov_id, gen_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY (gen_id) REFERENCES genres(gen_id)
);

CREATE TABLE rating (
    mov_id INTEGER,
    rev_id INTEGER,
    rev_stars INTEGER,
    num_o_ratings INTEGER,
    PRIMARY KEY (mov_id, rev_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY (rev_id) REFERENCES reviewer(rev_id)
);








