character*50 dd, explonum
integer anio, iex
open(5,file='tendencias.txt')
do i=1,100
  !para cada granja, copiar los datos a un fichero 'explot'
  open(15, file = 'explot')
  read(5,'(a14,i4)')dd,iex
  print *,'iex ',iex
  read(5,'(i5,f12.3)')anio, a
  write(15,'(i5,f12.3)')anio, a
  a1 = a
  do j = 1, 49
    read(5,'(i5,f12.3)')anio, a
    write(15,'(i5,f12.3)')anio, a
  enddo
  a2 = a
  close(15)
  !escribir script de gnuplot
  open(25,file='dibujar.plot')
  write(25,'(a)')'unset key'
  write(explonum,'(i3.3)')iex
  write(25,'(6a)')'set title ',char(39),'Explotación ',trim(adjustl(explonum)),char(39)
  write(25,'(4a)')'set xlabel ',char(39),'año',char(39)
  write(25,'(5a)')'set ylabel ',char(39),'Kilos de leche',char(39),' rotate'
  write(25,'(a)')'set terminal png'
  write(25,'(6a)')'set output ',char(39),'plot_explotacion_', trim(adjustl(explonum)),'.png',char(39)
  if (a2 .gt. a1) then
    write(25,'(8a)')'plot ',char(39),'explot',char(39),' w l lc ',char(39),'blue',char(39)  
  else
    write(25,'(8a)')'plot ',char(39),'explot',char(39),' w l lc ',char(39),'red',char(39)  
  end if
  close(25)
  !invocar gnuplot
  call system ('gnuplot '//char(39)//'dibujar.plot'//char(39))
enddo
stop
end

