#usage -- $ echo m max | awk -f poisson 
{
logm=log($1);p=-$1;i=0;
while (i<=$2) {
if(p>-50.) {print i,exp(p);}
p+=logm-log(++i);
}
}
