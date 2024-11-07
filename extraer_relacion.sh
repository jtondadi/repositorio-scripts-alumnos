#
# j.t (noviembre 2024)
#
# pasar directorios (Horas) con titulos (certificados con Horas)
# en pdf en una carpeta separada 
# creamos directorios (ordenado de mayor a menor)
# verificamos que sea menor de 10 (orden)
# y asignamos el nombre del archivo
#
# extraer archivo de modo descendente, y por directorios
#
clear
contador=1 
cd Horas
echo " Relación de titulaciones (por horas)" > relacion.txt
x=`ls -d */`
ls -d */ > directorios
x=`sort -r directorios`
for buscar in $x
do
 echo $buscar
 cd $buscar
 y=`ls`
 echo "$buscar" >> ../relacion.txt
 for archivo in $y
   do

    if [ $contador -lt 10 ]
     then
       a="00$contador.pdf"
     else

       if [ $contador -gt 99 ]
         then 
          a="$contador.pdf"
         else
          a="0$contador.pdf"
       fi
    fi

    echo $contador $archivo $a
    echo "$contador;$archivo" >> ../relacion.txt
    #read pause
    cp $archivo ../../pdfs/$a
    contador=`expr $contador + 1`
   done
 cp ../../Horas/relacion.txt ../..
 cd ..
 total=`cat relacion.txt | grep ";" | wc -l`
 echo $total
done
