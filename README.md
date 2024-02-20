# Tutorial 2 Game Development CSUI Even Semester 2023/2024
Created by Stefanus Ndaru Wedhatama - 2006526812

## Excercise
### Observations - Playtest

#### Q1: Apa saja pesan log yang dicetak pada panel Output?
Pesan yang pertama adalah `Platform initialized`, lalu ketika pesawat menyentuh batas atas, terdapat pesan _log_ kedua yaitu `Reaced objective!`.

#### Q2: Coba gerakkan landasan ke batas area bawah, lalu gerakkan kembali ke atas hingga hampir menyentuh batas atas. Apa saja pesan log yang dicetak pada panel Output?
Dari posisi nomor 1, ketika landasan digerakkan ke bawah lalu kembali ke atas, maka pesan `Reaced objective!` akan muncul kembali, sehingga menghasilkan _log_ berupa
```
Platform initialized
Reaced objective!
Reaced objective!
```

#### Q3: Buka scene `MainLevel` dengan tampilan workspace 2D. Apakah lokasi scene `ObjectiveArea` memiliki kaitan dengan pesan log yang dicetak pada panel Output pada percobaan sebelumnya?
Iya memiliki kaitan, di mana apabila objek `BlueShip` mencapai daerah `ObjectiveArea`, maka akan mencetak _log_ berupa `Reached Objective!`. Hal ini dikarenakan pada `ObjectiveArea` terdapat cek `func _on_ObjectiveArea_body_entered(body: RigidBody2D):` yang mendeteksi apabila `BlueShip` yang merupakan `RigidBody2D` masuk ke area, akan melakukan `print("Reached objective!")`.

---

### Observations - Manipulating Node and Scenes
#### Q4: Scene `BlueShip` dan `StonePlatform` sama-sama memiliki sebuah child node bertipe `Sprite`. Apa fungsi dari node bertipe `Sprite`?
`Sprite` merupakan node untuk menampilkan tekstur 2D, yang bisa merupakan bagian dari tekstur lebih besar atau frame dari suatu animasi sprite. Dalam kasus ini, `Sprite` menunjukkan gambar dari pesawat berwarna biru dan platform batu.

#### Q5: Root node dari scene `BlueShip` dan `StonePlatform` menggunakan tipe yang berbeda. `BlueShip` menggunakan tipe `RigidBody2D`, sedangkan `StonePlatform` menggunakan tipe `StaticBody2D`. Apa perbedaan dari masing-masing tipe node?
`StaticBody2D` memiliki sifat tidak merespon terhadap *collision* sehingga akan bersifat statis sesuai namanya. Sementara itu, `RigidBody2D` memiliki respon terhadap *collision* tetapi objek tidak dapat dikontrol secara langsung, melainkan diberi *force*. Karena itu, `StonePlatform` yang bersifat seperti tembok cocok untuk statis sehingga diberi `StaticBody2D`, sementara `BlueShip` bisa dipindah menggunakan *force* sehingga cocok untuk `RigidBody2D`, dan keduanya memiliki *collision*.

#### Q6: Ubah nilai atribut `Mass` dan `Weight` pada tipe `RigidBody2D` secara bebas di scene `BlueShip`, lalu coba jalankan scene `MainLevel`. Apa yang terjadi?
Dalam kasus ini, tidak ada yang berubah karena `Mass` dan `Weight` dalam konteks ini berkaitan dengan seberapa cepat jatuh pesawat, yang dipengaruhi oleh gravitasi. Karena `GravityScale` tidak diubah, maka mengganti `Mass` dan `Weight` tidak akan berakibat apa-apa. Selain itu, menggerakkan platform juga tidak menggunakan `AppliedForce` sehingga tidak memberikan perbedaan pula dari mendorong pesawat apabila terdapat perubahan di `Mass` atau `Weight`. Selain itu, baik `Mass` dan `Weight` akan saling berkaitan dan _scaling_ menyesuaikan `GravityScale`.

#### Q7: Ubah nilai atribut `Disabled` pada tipe `CollisionShape2D` di scene `StonePlatform`, lalu coba jalankan scene `MainLevel`. Apa yang terjadi?
Jika diubah menjadi `Disabled`, maka Pesawat akan jatuh tembus `StonePlatform`, karena *collision* dihapus pada objek tersebut sehingga bisa ditembusi oleh objek yang memiliki *collision* lain.

#### Q8: Pada scene `MainLevel`, coba manipulasi atribut `Position`, `Rotation`, dan `Scale` milik node BlueShip secara bebas. Apa yang terjadi pada visualisasi `BlueShip` di Viewport?
Apabila atribut-atribut tersebut dimanipulasi, maka `BlueShip` akan mengalami perubahan dalam tampilan dan posisi awal di Viewport. Seperti contoh, manipulasi `Position` akan mengubah posisi pesawat, manipulasi `Rotation` akan mengubah rotasi pesawat, dan manipulasi `Scale` akan mengubah ukuran pesawat.

#### Q9: Pada scene `MainLevel`, perhatikan nilai atribut `Position` node `PlatformBlue`, `StonePlatform`, dan `StonePlatform2`. Mengapa nilai Position node `StonePlatform` dan `StonePlatform2` tidak sesuai dengan posisinya di dalam scene (menurut Inspector) namun visualisasinya berada di posisi yang tepat?
Hal ini dikarenakan `StonePlatform` merupakan *child node* dari `PlatformBlue` sehingga rujukan utama pada posisi adalah terhadap *center point* dari `Platform Blue`.