This is an application to publish podcasts. It's better than WP podcast plugins because it uses ffmpeg in the background to convert your podcast to different audio formats.

Also, it's written in RoR so modifying it is a breeze, compared to apocalyptic PITA that is Wordpress.

**WARNING: This app was created for my own personal Nerdblog.pl Podcast that is not available anymore. I didn't have time to clean up the code or remove all Nerdblog.pl related stuff. Consider this alpha version.**

## TODO

### Important features and fixes

- ~~template support, based on Handlebars/FlavourSaver (it's important to remove all Nerdblog.pl related stuff from app and I cannot keep changed version of the app forever)~~
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

The MIT License (MIT)

Copyright (c) 2014 Michał Matyas

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
