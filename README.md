# Flickr API

## Descrition
The goal of this projec was to build an app that shows a user's photos based on their user ID. The purpose of the project is to work with the Flickr API.
A full description of the project is on [The Odin Project](https://www.theodinproject.com/lessons/ruby-on-rails-flickr-api).

Repository: https://github.com/PlaustralCL/flickr-api

Live Preview:


## Reflections
* This project was the first time I had worked with an external API. It helped me see the need to keep the public interface separate from the internal process used to obatain the results. This is similar to Object Oriented Programming.
* I tried to use a pre-defined Flicker API wrapper gem, but had trouble getting it to work. Instead, I built the interface myself using the `net/http` and `json` Ruby standard libraries. It was the first time I had used both of those libraries.
* There is error checking for invalid user IDs.  However, rather than specifically looking for bad IDs, any error will show the same result: as if the user had no photos.

## Future Enhancements
* More robust error messages for invalid user IDs.