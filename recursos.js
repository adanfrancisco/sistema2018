function crearElemento(elemento, identificador, clase, texto, ruta, valor) {
    item = document.createElement(elemento);
    if (identificador !=='__'){ item.id = identificador; }
    if (clase !=='__') { item.className = clase; }
    if (texto !=='__') { item.innerText = texto; }
    if (ruta !== '__') { item.dataset.cargarVista = ruta; }
    if (valor !== '__') { item.value = valor; }
    return item;
}
btn = crearElemento('button','num_parrafos','agrega tus clases','Numero parrafos','__','__');
body = document.body;
body.appendChild(btn);