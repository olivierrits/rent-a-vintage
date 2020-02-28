import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initMapbox } from '../plugins/init_mapbox';


let btn_wrap = document.querySelector("#large-new-btn")
if(btn_wrap){

  btn_wrap.addEventListener("click", (event) =>
    document.querySelector("form").submit()
    )
}

initMapbox();

