xquery version "1.0";


<resultados>
{
for $x in doc("cd.xml")/catalogo/cd
return $x
}
</resultados>
