# BI-VAK
## 8. Domácí úloha

- Pro vypracování úlohy jsem si vytvořil 6-úhelník definovaný těmito rovnicemi
$$
\begin{align*}
y&=4x+2 \\
y&=x+1.12 \\
y&=1x+2 \\
y&=x-1 \\
y&=0.25x-0.25 \\
y&=-0.5x
\end{align*}
$$

<p align="center">
<img src="https://www.desmos.com/calculator/ilncbgffur?embed" alt="Graph" style="width:20%; border:0;">
</p>

- Následně jsem našel v ***Lineární programování: Úvod do informatiky*** uvedeném pod proseminářem tuto problematiku
- Zde byl uvedený následující vztah
$
\frac{s_2-a_is_1-b_i}{\sqrt{a^2_i+1}} \geq r \ \ \ ,i=1,2,...,k
\\ a \\
\frac{s_2-a_is_1-b_i}{\sqrt{a^2_i+1}} \leq -r \ \ \ ,i=k,k+1,...,n
$
- Toto jsem následně použil v rešiči takto
```
     var s1;
     var s2;
     var r >= 0;
     
     maximize radius: r;
     
     subject to c1:  (s2-1*s1-(-1))/(sqrt(1*1+1)) >= r;
     subject to c2:  (s2-0.25*s1-(-0.25))/(sqrt(0.25*0.25+1)) >= r;
     subject to c3:  (s2-(-0.5)*s1-0)/(sqrt((-0.5)*(-0.5)+1)) >= r;
     subject to c4:  (s2-4*s1-2)/(sqrt(4*4+1)) <= -r;
     subject to c5:  (s2-1*s1-1.25 )/(sqrt(1*1+1)) <= -r;
     subject to c6:  (s2-(-1)*s1-2)/(sqrt((-1)*(-1)+1)) <= -r;
     
     solve;
     display: radius, s1, s2;
     end;
```
- pro mnou zadanou sadu rovni vyšel střed $S=(0.386, 0.604)$ a poloměr $r=0.713$
- Takto vypadá kružnice s maximalizovaným poloměrem takovým, aby se celá kružnice vešla do definovaného 6-úhelníku.
<p align="center">
<img src="https://www.desmos.com/calculator/hzfyuzksuu?embed" alt="Graph" style="width:20%; border:0;">
</p>