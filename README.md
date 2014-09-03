This is an application to publish podcasts. It's better than WP podcast plugins because it uses ffmpeg in the background to convert your podcast to different audio formats.

Also, it's written in RoR so modifying it is a breeze, compared to apocalyptic PITA that is Wordpress.

## TODO

### Important features and fixes

- template support, based on Handlebars/FlavourSaver (it's important to remove all Nerdblog.pl related stuff from app and I cannot keep changed version of the app forever)
- decouple from my app because it was finished in hurry and still has stuff that shouldn't be in this repo
- ~~RSS/iTunes feed (!)~~
- ~~check what is wrong with mime types for audio~~

### Less important but still to do asap
- transcript support
- autopublishing after audio is converted successfully
- publish at specific hour

### For future, when I'm ready to open source this project
- tagging support
- support for autoposting on Twitter and Facebook
- advanced transcript support
  - possibly with timestamps / subtitles?
  - maybe I could generate a video file with background image and subtitles on it? but that's an idea for the far future

## License

MIT License, I'll copy the text here later.