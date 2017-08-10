package com.scottmarden.lookify.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.scottmarden.lookify.models.Song;
import com.scottmarden.lookify.services.SongService;

@Controller
public class SongCtrl {
	
	private final SongService songService;
	
	public SongCtrl(SongService songService) {
		this.songService = songService;
	}
	
	@RequestMapping(value="/")
	public String index() {
		return "index.jsp";
	}
	
	@RequestMapping(value="/dashboard")
	public String getPlaylist(Model model) {
		List<Song> songs = songService.allSongs();
		model.addAttribute("songs", songs);
		return "playlist.jsp";
	}
	
	@RequestMapping(value="/songs/new")
	public String newSong(@ModelAttribute("song") Song song) {
		return "newSong.jsp";
	}
	
	@PostMapping(value="/songs/new")
	public String createSong(@Valid @ModelAttribute("song") Song song, BindingResult result) {
		if(result.hasErrors()) {
			return "newSong.jsp";
		}else {
			songService.addSong(song);
			return "redirect:/dashboard";
		}
	}
	
	@RequestMapping(value="/songs/top10")
	public String topTen(Model model) {
		List<Song> topTen = songService.findTopTen();
		model.addAttribute("topTen", topTen);
		return "topTen.jsp";
	}
	
	@RequestMapping(value="/songs/{id}")
	public String songDetails(@PathVariable("id") Long id, Model model) {
		Song song = songService.findSongById(id);
		model.addAttribute("song", song);
		return "songDetail.jsp";
	}
	
	@RequestMapping(value="/delete/{id}")
	public String destroySong(@PathVariable("id") Long id) {
		songService.destroySong(id);
		return "redirect:/";
	}
	
	@RequestMapping(value="/search")
	public String searchArtist(@RequestParam(value="query", required=false) String query, Model model) {
		System.out.println("query: " + query);
		List<Song> foundSongs = songService.searchByArtist(query);
		if(foundSongs.size() > 0) {
			System.out.println("Controller: Found Songs!");
			model.addAttribute("foundSongs", foundSongs);
		}else {
			String failedSearch = "No artists match your search!";
			model.addAttribute("failedSearch", failedSearch);
		}
		return "results.jsp";
		
	}
}
