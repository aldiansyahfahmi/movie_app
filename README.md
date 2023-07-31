<p align="center">
    <a href="https://flutter.dev" target="_blank">
        <img align="middle" src="https://camo.githubusercontent.com/ac6ddc680bd6541f36ce4659b4bac7390e75d91a8016691c45cb28ccd4002fdc/68747470733a2f2f73746f726167652e676f6f676c65617069732e636f6d2f636d732d73746f726167652d6275636b65742f36653139666565366234376233366361363133662e706e67" width="400">
    </a>
</p>
<br>
<br>
<p align="center">
    Develop with <a href="https://flutter.dev" target="_blank">Flutter Framework</a>, by <a href="https://aldev.tempatkoding.com" target="_blank">Aldiansyah Fahmi</a>
</p>
<br>

<h2> Features </h2>
<ul>
    <li>Movies</li>
    <li>Movie Details</li>
</ul>

<br>
<p align="center">
    <a target="_blank"><img src="assets/screenshoot/Movie App.png" >
</p>

<h2> Packages </h2>
<ul>
    <li>cached_network_image</li>
    <li>Movie carousel_slider</li>
    <li>dartz</li>
    <li>dio</li>
    <li>equatable</li>
    <li>flutter_bloc</li>
    <li>flutter_screenutil</li>
    <li>flutter_staggered_grid_view</li>
    <li>flutter_svg</li>
    <li>get_it</li>
    <li>intl</li>
    <li>page_transition</li>
    <li>shimmer</li>
    <li>url_launcher</li>
</ul>

<h2> Project Structure </h2>
<pre class="notranslate"><code>
# Root Project
.
|
├── assets                       
│   ├── color         
│   ├── fonts   
│   └── images  
└── lib                       
    ├── app            
    ├── di            
    ├── domains            
    │   └── domainName            
    │       ├── data            
    │       │   ├── datasource            
    │       │   ├── mapper            
    │       │   ├── models            
    │       │   └── repositories            
    │       └── domain            
    │           ├── entities            
    │           ├── repositories            
    │           └── usecases            
    ├── launcher            
    ├── presentation
    │   └── presentationName            
    │       ├── bloc                     
    │       └── ui                     
    └── shared_libraries     
        ├── component                
        └── core                
        └── utils                
</code></pre>
