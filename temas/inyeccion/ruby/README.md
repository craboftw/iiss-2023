# Inyección de Dependencias en Ruby

La inyección de dependencias es un patrón de diseño que se utiliza en programación orientada a objetos para separar la creación y la resolución de dependencias de una clase, de su lógica de negocio. En Ruby, se puede implementar la inyección de dependencias mediante la utilización de objetos o clases que se encargan de crear y proveer las instancias necesarias de otras clases que se necesiten en un programa.
## Ejecución del Código y Gems

El código proporcionado utiliza la gema `artii` que es una librería de Ruby que permite crear arte ASCII a partir de texto. Para utilizarla, primero es necesario instalarla mediante el comando `gem install artii` o incluyéndola en el archivo Gemfile del proyecto.

Luego, se define una función llamada `slay` que utiliza la clase `Artii::Base` para crear una instancia de la clase `Artii::Base` con la opción de fuente de "slant". Luego, utiliza el método `asciify` de la instancia creada para transformar el texto "SLAY !" en arte ASCII y lo guarda en una variable llamada `line`. Finalmente, se utiliza el método `puts` para imprimir la variable `line` en la consola.

La función `slay` es llamada al final del código mediante la línea `slay()`, lo que provoca que se ejecute el código dentro de la función y se imprima en la consola el texto "SLAY !" en forma de arte ASCII generado por la gema `artii`.
```
   _____ __    _____  __   __
  / ___// /   /   \ \/ /  / /
  \__ \/ /   / /| |\  /  / /
 ___/ / /___/ ___ |/ /  /_/
/____/_____/_/  |_/_/  (_)
```
