real*8 unif,x1
integer anio
x1 = 0.986354746d+10
open(5,file='tendencias.txt')
do i=1,100
  write(5,'(a,i4)')'Explotación ',i
  a = 4500 + 1000*unif(x1)
  b = 300 * (unif(x1)-0.3)
  anio = 1970
  write(5,'(i5,f12.3)')anio, a
  do j = 1, 49
    anio = anio + 1
    aa = a + b * j + 1000*unif(x1)
    write(5,'(i5,f12.3)')anio, aa
  enddo
enddo
stop
end

function unif(x1)
real*8 x1,unif
x1 = mod (16807.0d0 * x1, 2147483647.0d0)
unif = x1/2147483647.0d0
return
end function unif

