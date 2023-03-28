- # Mecanismo de anotación para métodos de clases con el módulo `Anuncio`

El código proporciona un mecanismo de anotación para métodos de clases utilizando el módulo `Anuncio`. Cuando se incluye el módulo `Anuncio` en una clase, se extiende la clase con el método `anuncio` definido en el módulo `ClassMethods`.

El método `anuncio` toma un argumento `method_name`, que es el nombre del método que se va a anotar. Luego, se utiliza el método `alias_method` para crear un alias del método original con un nombre diferente, `#{method_name}_sin_anuncio`, lo que permitirá que el método original sea llamado más tarde.

A continuación, se define un nuevo método utilizando `define_method` con el mismo nombre que el método original. Este nuevo método imprime un mensaje de anuncio usando la biblioteca Artii y luego llama al método original utilizando `send`.

Cuando se llama al método anotado, se ejecuta el nuevo método definido en lugar del método original. El nuevo método primero imprime un mensaje de anuncio y luego llama al método original utilizando el alias creado anteriormente.

En el ejemplo proporcionado, la clase `Ejemplo` incluye el módulo `Anuncio` y define dos métodos, `metodo_sin_anuncio` y `metodo_con_anuncio`. El método `metodo_con_anuncio` está anotado utilizando `anuncio :metodo_con_anuncio`.

Cuando se crea una instancia de la clase `Ejemplo` y se llama a los métodos `metodo_sin_anuncio` y `metodo_con_anuncio`, el primero se ejecuta sin anotaciones mientras que el segundo se ejecuta con un mensaje de anuncio impreso en la consola antes de la ejecución del método original.