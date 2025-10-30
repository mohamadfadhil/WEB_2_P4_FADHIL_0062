<?php 
$id = $_GET['id'] ?? 0;

$stmt = $koneksi->prepare("
  SELECT * FROM tb_penjualan
  LEFT JOIN tb_pelanggan ON tb_pelanggan.id_pelanggan = tb_penjualan.id_pelanggan
  WHERE id_penjualan = ?
");
$stmt->bind_param('i', $id);
$stmt->execute();
$data = $stmt->get_result()->fetch_assoc();

if (!$data) {
    echo "<div class='alert alert-danger'>Data penjualan tidak ditemukan.</div>";
    exit;
}
?>

<div class="container-fluid px-4">
  <h1 class="mt-4">Detail Penjualan</h1>
  <ol class="breadcrumb mb-4">
    <li class="breadcrumb-item active">Detail Penjualan</li>
  </ol>
  <a href="?page=penjualan" class="btn btn-warning mb-3">Kembali</a>
  <hr>

  <table class="table table-bordered">
      <tr>
          <td width="200">Nama Pelanggan</td>
          <td width="1">:</td>
          <td><?= htmlspecialchars($data['nama_pelanggan']); ?></td>
      </tr>

      <?php 
      $stmt = $koneksi->prepare("
        SELECT * FROM tb_detailpenjualan
        LEFT JOIN tb_produk ON tb_produk.id_produk = tb_detailpenjualan.id_produk
        WHERE id_penjualan = ?
      ");
      $stmt->bind_param('i', $id);
      $stmt->execute();
      $prod = $stmt->get_result();

      while($produk = $prod->fetch_assoc()){
      ?>
      <tr>
          <td><?= htmlspecialchars($produk['nama_produk']); ?></td>
          <td>:</td>
          <td>
            Harga Satuan Rp <?= number_format($produk['harga_produk'], 0, ',', '.'); ?><br>
            Jumlah Produk <?= $produk['jumlah_produk']; ?><br>
            Sub Total Rp <?= number_format($produk['sub_total'], 0, ',', '.'); ?><br>
          </td>
      </tr>
      <?php } ?>

      <tr>
          <td><strong>Total</strong></td>
          <td>:</td>
          <td><strong>Rp <?= number_format($data['total_harga'], 0, ',', '.'); ?></strong></td>
      </tr>
  </table>
</div>
