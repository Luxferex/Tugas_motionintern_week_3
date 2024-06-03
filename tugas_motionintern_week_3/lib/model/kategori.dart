class kategori {
  String imageUrl, nama, harga, deskripsi, namalengkap;

  kategori({
    required this.imageUrl,
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.namalengkap,
  });
}

List<kategori> kategorigrid = [
  kategori(
    nama: "BMW",
    namalengkap: "BMW 507",
    imageUrl: "bmw.png",
    harga: "\$ 12 M",
    deskripsi: "nanti dulu",
  ),
  kategori(
    nama: "Porsche",
    namalengkap: "Porshce GT3-RS",
    imageUrl: "porsche.png",
    harga: "\$ 10 M",
    deskripsi: "nanti dulu",
  ),
  kategori(
    nama: "Lamborghini",
    namalengkap: "Lamborghini 400 Gt",
    imageUrl: "lambo.png",
    harga: "\$ 18 M",
    deskripsi: "nanti dulu",
  ),
  kategori(
    nama: "Ferrari",
    namalengkap: "Ferrari 250 GTO",
    imageUrl: "ferrari.png",
    harga: "\$ 23 M",
    deskripsi: "nanti dulu",
  ),
];
