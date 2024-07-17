echo "MD a PDF";
if [ "$1" == '?' ]; then
	echo "Recuerde que debe tener instalado los paquetes 'pandoc' y 'latex'. ";
	echo "sudo yum install pandoc texlive-scheme-full";
	echo "";
	echo "#1: Debe indicar el archivo con markdown para convertir en PDF.";
	exit;
fi;

if [ "$1" != "" ]; then

  Filename=$(echo $1 | cut -d'.' -f 1)
  if [ "$Filename" == '' ]; then
    Filename="document"
  fi;

  line=$(head -n 1 $1)
  line2=$(sed -n '2p' $1)
  title="title: ${line/\#\ /}"
  subtitle="subtitle: ${line2/\##\ /}"

  echo "---" > $Filename.tmp.md
  echo $title >> $Filename.tmp.md
  echo $subtitle >> $Filename.tmp.md
  tail -n+4 layout.md >> $Filename.tmp.md
  cat $1 >> $Filename.tmp.md
  pandoc -s --toc --top-level-division=chapter -f markdown-implicit_figures  -t pdf $Filename.tmp.md -o $Filename.pdf
  #rm -f $Filename.tmp.md
fi;
