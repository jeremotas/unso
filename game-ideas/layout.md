---
title: TITULO
subtitle: SUBTITULO
author: Jeremias Cavallero
titlepage: true
header-includes:
	- \usepackage[utf8]{inputenc}
    - \usepackage[spanish]{babel}
    - \usepackage{graphicx}
    - \usepackage{array}
    - \usepackage[export]{adjustbox}
    - \usepackage{float}
    - \usepackage{wrapfig}
    - \usepackage{subcaption}
    - \usepackage{hyperref}
    - \usepackage{fancyhdr}
    - \usepackage{lastpage}
    - \usepackage{tikz}
    - \usepackage{tikzpagenodes}
    - \usepackage{lipsum}    
    - \usepackage{pdfpages}
    - \usepackage{titlepic}
    - \usepackage[explicit]{titlesec}
    - \pagecolor[rgb]{0.1,0.1,0.2}
    - \color[rgb]{1,1,1}
    - \usepackage[defaultfam,tabular,lining,alternates]{montserrat}
    - \usepackage[T1]{fontenc}
    - \usepackage[top=3cm,bottom=2cm,left=3cm,right=3cm,footskip=1.5cm,headsep=1cm,headheight=2cm,asymmetric]{geometry}   
    - \renewcommand{\baselinestretch}{1.5} 
    - \pagestyle{fancy}    
    - \fancyhf{}    
    - \fancyhead[R]{\rightmark}
    - \fancyhead[L]{\includegraphics[width=1.5cm,valign=c]{logo-romero.png}}
    - \fancyfoot[L]{La Romero - Estudio}
    - \fancyfoot[R]{Pag. \thepage}
    - \titlepic{\includegraphics[width=5cm]{logo-romero.png}}
output:
    pdf_document
classoption: titlepage
---

