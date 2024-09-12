-- Crear la keyspace (espacio de claves)
CREATE KEYSPACE spotify_db WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 3};

-- Usar el keyspace creado
USE spotify_db;

-- Crear la tabla de Usuarios
CREATE TABLE usuarios (
    user_id UUID PRIMARY KEY,
    nombre TEXT,
    correo_electronico TEXT,
    fecha_registro DATE
);

-- Crear la tabla de Artistas
CREATE TABLE artistas (
    artista_id UUID PRIMARY KEY,
    nombre_artista TEXT
);

-- Crear la tabla de Álbumes
CREATE TABLE albumes (
    album_id UUID PRIMARY KEY,
    nombre_album TEXT,
    artista_id UUID,
    fecha_lanzamiento DATE
);

-- Crear la tabla de Canciones
CREATE TABLE canciones (
    cancion_id UUID PRIMARY KEY,
    titulo_cancion TEXT,
    album_id UUID,
    duracion TEXT
);

-- Crear la tabla de Listas de Reproducción
CREATE TABLE listas_reproduccion (
    playlist_id UUID PRIMARY KEY,
    nombre_playlist TEXT,
    user_id UUID
);

-- Crear la tabla de Canciones en Listas de Reproducción
-- Nota: En Cassandra, para unirse a canciones en listas de reproducción, normalmente se usa una tabla con una clave compuesta
CREATE TABLE canciones_en_listas (
    playlist_id UUID,
    cancion_id UUID,
    PRIMARY KEY (playlist_id, cancion_id)
);
