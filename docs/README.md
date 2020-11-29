# Faiz's Personal Website

Hi! This repository contains the source files for my website, [faizsurani.com](https://faizsurani.com).

This website is built with [Pollen](https://github.com/mbutterick/pollen), an open-source publishing system built in Racket, a Lisp dialect. Pollen is primarily for book publishing, but its incredible versatility makes it a great fit for this kind of website as well.

A blog post describing how this website was built is forthcoming. I'll update this README when it's published.

Some cool features of the site:
- For pages containing written content, LaTeX-generated PDF versions are also available.
- There is absolutely zero JavaScript present anywhere on the website. This was a goal of mine after I tired of my old Gatsby site's bloat. It's all HTML and CSS, which both scratches my minimalism itch and makes the site extremely fast.
- Support for well-formatted sidenotes, figures, verses, block quotes, and so on. All of them translate gracefully to both the generated PDFs and smaller screen sizes.