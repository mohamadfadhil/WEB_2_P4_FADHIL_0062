<div class="container-fluid px-4">
    <h1 class="mt-4">Penjualan</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item active">Penjualan</li>
    </ol>

    <a href="?page=tambah_penjualan" class="btn btn-primary">+ Tambah Penjualan</a>
    <hr>
    <table class="table table-bordered">
        <tr>
            <th>No</th>
            <th>Tanggal Pembelian</th>
            <th>Nama Pelanggan</th>
            <th>Total Harga</th>
            <th>Aksi</th>
        </tr>
        <?php 
        $no = 1;
        //mengambil data dari tb pelanggan dan tb penjualan
        $query = mysqli_query($koneksi, "SELECT*FROM tb_penjualan LEFT JOIN tb_pelanggan ON tb_pelanggan.id_pelanggan = tb_penjualan.id_pelanggan");
        while ($data = mysqli_fetch_array($query)) {
        ?>
        <tr>
            <td><?= $no++; ?></td>
            <td><?= $data['tanggal_penjualan']; ?></td>
            <td><?= $data['nama_pelanggan']; ?></td>
            <td><?= $data['total_harga']; ?></td>
            <td>
                <a href="?page=detail_penjualan&&id=<?= $data['id_penjualan']; ?>" class="btn btn-warning">Detail</a>
                <a href="?page=hapus_penjualan&&id=<?= $data['id_penjualan']; ?>" class="btn btn-danger btn-sm" onclick="return confirm('Yakin ingin menghapus data ini?')">Hapus</a>
            </td>
        </tr>
        <?php } ?>
    </table>
</div>