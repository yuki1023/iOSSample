($2>=0) {
  printf("%8.2f  %8.2f  %8.2f\n", $1,$2,sqrt($2))
}

# 以下でもほぼ同じ
#{
#  if($2>=0) {printf("%8.2f  %8.2f  %8.2f\n", $1,$2,sqrt($2));}
#  else {printf("negative value %f at %f\n",$2,$1) | "cat 1>&2";}
#}