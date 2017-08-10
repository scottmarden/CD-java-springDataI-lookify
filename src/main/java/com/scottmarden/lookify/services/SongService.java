package com.scottmarden.lookify.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.scottmarden.lookify.models.Song;
import com.scottmarden.lookify.repositories.SongRepository;

@Service
public class SongService {
	private SongRepository songRepository;
	
	public SongService(SongRepository songRepository) {
		this.songRepository = songRepository;
	}
	
	public void addSong(Song song) {
		songRepository.save(song);
	}
	
	public List<Song> allSongs(){
		return (List<Song>) songRepository.findAll();
	}
	
	public Song findSongById(Long id) {
		return songRepository.findOne(id);
	}
	
	public List<Song> findSongsByArtist(String artist){
		return songRepository.findByArtist(artist);
	}
	
	public List<Song> findSongsByRating(int rating){
		return songRepository.findByRating(rating);
	}
	
	public List<Song> findTopTen(){
		return songRepository.findAllByOrderByRatingDesc();
	}
	
	public void destroySong(Long id) {
		songRepository.delete(id);
	}
	
	public List<Song> searchByArtist(String query){
		return songRepository.findByArtistContaining(query);
	}
}
