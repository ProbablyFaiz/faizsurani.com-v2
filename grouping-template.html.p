◊; This template provides the structure of pages that perform "grouping" functions: series and type roots.
◊; For example, the "law" series and "blog" type.
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <title>◊(hash-ref metas 'title)</title>
  ◊; Because I deploy this site in a sub-directory (rather than a domain root) I
  ◊; have to use relative paths instead of absolute ones. Defining path-prefix
  ◊; is just my way of coping with this.
  ◊(define path-prefix (if (string-contains (symbol->string here) "/") "../" ""))
  ◊(define source-file (select-from-metas 'here-path metas))
  ◊(define pollen-source-listing
      (regexp-replace #px"(.*)\\/(.+).html" (symbol->string here) "\\2.pollen.html"))
  <link rel="stylesheet" href="◊|path-prefix|css/tufte.css"/>
  <link rel="stylesheet" href="◊|path-prefix|css/joel.css"/>
  <link rel="alternate" type="application/atom+xml" title="Atom feed" href="◊|path-prefix|feed.xml" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style type="text/css">
   img { mix-blend-mode: multiply; }
  </style>
</head>
<body><article>
    <h1>◊(hash-ref metas 'title)</h1>
    ◊when/splice[(and (select-from-metas 'author metas) (select-from-metas 'doc-publish-date metas))]{
        <h3>◊(hash-ref metas 'author) &middot; ◊(pubdate->abbr-english (hash-ref metas 'doc-publish-date))</h3>
    }
    <nav><ul>
        ◊when/splice[(and (previous here) (not (eq? (parent here) (previous here))))]{
            <li><a href="◊|path-prefix|◊|(previous here)|">&larr; Previous</a></li>
        }
        ◊when/splice[(not (eq? here 'index.html))]{
            <li><a href="◊|path-prefix|index.html">&uarr; Home</a></li>
        }
        ◊when/splice[(and (next here) (member (next here) (siblings here)))]{
            <li><a href="◊|path-prefix|◊|(next here)|">Next &rarr;</a></li>
        }
        ◊when/splice[(pdfable? source-file)]{
            <li><a href="◊(or (select-from-metas 'pdf-url metas) ◊pdfname[source-file])">
                  <img src="◊|path-prefix|css/pdficon.png" width="15" height="15" alt="Download PDF" />
                  <span class="caps" style="font-style: normal">PDF</span></a></li>
        }
    ◊;    ◊when/splice[(string-contains path-prefix "/")]{
    ◊;        <li style="width: auto;">
    ◊;          <a href="◊|pollen-source-listing|" title="View the Pollen source for this file"
    ◊;             class=" sourcelink code">&loz; Pollen Source</a></li>
    ◊;    }
    </ul></nav>

	◊(map ->html (select-from-doc 'body here))
</article>
◊when/splice[(equal? "Faiz Surani" (select-from-metas 'author here))]{
    <footer><hr>
    <p>My name is Faiz Surani. I’m currently a Computing major in the College of Creative Studies at UC Santa Barbara. You can find me on <a href="https://github.com/ProbablyFaiz">GitHub</a>, <a href="https://www.linkedin.com/in/faiz-s-74a510126/">LinkedIn</a>, or <a href="mailto:faiz.surani@gmail.com">by email</a>.</p>
    </footer>
}
</body>
</html>