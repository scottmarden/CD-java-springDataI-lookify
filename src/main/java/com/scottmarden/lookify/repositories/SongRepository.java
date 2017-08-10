package com.scottmarden.lookify.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.scottmarden.lookify.models.Song;

@Repository
public interface SongRepository extends CrudRepository<Song, Long> {
	
	public List<Song> findByArtist(String artist);
	public List<Song> findByRating(int rating);
	public List<Song> findAllByOrderByRatingDesc();
	public List<Song> findByArtistContaining(String query);
}
