-- Connect to the postgres database to create the universe database
\c postgres

-- Create the universe database
CREATE DATABASE universe;

-- Connect to the universe database
\c universe

-- Create the galaxy table
CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  type VARCHAR(255) NOT NULL,
  age_in_millions_of_years INT NOT NULL,
  has_life BOOLEAN
);

-- Create the star table
CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  type VARCHAR(255) NOT NULL,
  galaxy_id INT REFERENCES galaxy(galaxy_id),
  mass NUMERIC NOT NULL,
  has_planets BOOLEAN
);

-- Create the planet table
CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  type VARCHAR(255) NOT NULL,
  star_id INT REFERENCES star(star_id),
  distance_from_star INT NOT NULL,
  has_life BOOLEAN
);

-- Create the moon table
CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  planet_id INT REFERENCES planet(planet_id),
  diameter INT NOT NULL,
  is_spherical BOOLEAN,
  orbital_period INT
);

-- Create the comet table
CREATE TABLE comet (
  comet_id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  description TEXT,
  orbit_type VARCHAR(255) NOT NULL,
  period INT NOT NULL
);

-- Insert data into galaxy table
INSERT INTO galaxy (name, type, age_in_millions_of_years, has_life) VALUES
('Milky Way', 'Spiral', 13600, TRUE),
('Andromeda', 'Spiral', 10000, FALSE),
('Triangulum', 'Spiral', 9000, FALSE),
('Whirlpool', 'Spiral', 12000, FALSE),
('Sombrero', 'Elliptical', 13000, FALSE),
('Cartwheel', 'Ring', 14000, FALSE);

-- Insert data into star table
INSERT INTO star (name, type, galaxy_id, mass, has_planets) VALUES
('Sun', 'G-type', 1, 1.989e30, TRUE),
('Alpha Centauri', 'G-type', 1, 2.18e30, TRUE),
('Betelgeuse', 'M-type', 2, 1.42e31, FALSE),
('Sirius', 'A-type', 3, 4.018e30, TRUE),
('Vega', 'A-type', 4, 2.135e30, TRUE),
('Rigel', 'B-type', 5, 3.75e31, TRUE);

-- Insert data into planet table
INSERT INTO planet (name, type, star_id, distance_from_star, has_life) VALUES
('Earth', 'Terrestrial', 1, 1, TRUE),
('Mars', 'Terrestrial', 1, 2, FALSE),
('Jupiter', 'Gas Giant', 1, 5, FALSE),
('Proxima b', 'Terrestrial', 2, 1, TRUE),
('Barnard b', 'Super-Earth', 2, 1, FALSE),
('TRAPPIST-1e', 'Terrestrial', 3, 1, FALSE),
('TRAPPIST-1f', 'Terrestrial', 3, 2, FALSE),
('TRAPPIST-1g', 'Terrestrial', 3, 3, FALSE),
('TRAPPIST-1h', 'Terrestrial', 3, 4, FALSE),
('Kepler-22b', 'Super-Earth', 4, 1, TRUE),
('Kepler-69c', 'Super-Earth', 4, 2, FALSE),
('Kepler-62f', 'Super-Earth', 5, 1, FALSE);

-- Insert data into moon table
INSERT INTO moon (name, planet_id, diameter, is_spherical, orbital_period) VALUES
('Moon', 1, 3474, TRUE, 27),
('Phobos', 2, 22, FALSE, 0.3),
('Deimos', 2, 12, FALSE, 1.3),
('Io', 3, 3643, TRUE, 1.8),
('Europa', 3, 3122, TRUE, 3.5),
('Ganymede', 3, 5268, TRUE, 7.1),
('Callisto', 3, 4820, TRUE, 16.7),
('Proxima b Moon', 4, 1500, TRUE, 15),
('Barnard b Moon 1', 5, 1000, TRUE, 30),
('Barnard b Moon 2', 5, 800, TRUE, 60),
('TRAPPIST-1e Moon 1', 6, 500, TRUE, 20),
('TRAPPIST-1e Moon 2', 6, 400, TRUE, 25),
('TRAPPIST-1f Moon 1', 7, 300, TRUE, 30),
('TRAPPIST-1f Moon 2', 7, 250, TRUE, 35),
('TRAPPIST-1g Moon 1', 8, 200, TRUE, 40),
('TRAPPIST-1g Moon 2', 8, 150, TRUE, 45),
('TRAPPIST-1h Moon 1', 9, 100, TRUE, 50),
('Kepler-22b Moon', 10, 1100, TRUE, 20),
('Kepler-69c Moon', 11, 1200, TRUE, 25),
('Kepler-62f Moon', 12, 1300, TRUE, 30);

-- Insert data into comet table
INSERT INTO comet (name, description, orbit_type, period) VALUES
('Halley', 'Famous periodic comet', 'Elliptical', 75),
('Hale-Bopp', 'Long-period comet', 'Elliptical', 2533),
('Encke', 'Short-period comet', 'Elliptical', 3.3);
