<?php
include 'includes/db.php';
include 'includes/header.php';

$sql = "SELECT ime, prezime, uloga, status_u_klubu
        FROM osoblje
        ORDER BY status_u_klubu ASC, uloga ASC, prezime ASC";
$result = $conn->query($sql);
?>

<section class="section">
    <div class="container table-card">
        <h2 class="table-title">Osoblje</h2>
        <p class="table-subtitle">Pregled trenera i ostalog osoblja povezanog s ekipom.</p>

        <div class="table-wrap no-scroll">
            <table class="modern-table compact-table">
                <thead>
                    <tr>
                        <th>Ime i prezime</th>
                        <th>Uloga</th>
                        <th>Status u klubu</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if ($result && $result->num_rows > 0): ?>
                        <?php while ($row = $result->fetch_assoc()): ?>
                            <tr>
                                <td class="simple-name"><?php echo htmlspecialchars($row['ime'] . ' ' . $row['prezime']); ?></td>
                                <td><?php echo htmlspecialchars($row['uloga']); ?></td>
                                <td>
                                    <?php if ($row['status_u_klubu'] === 'otisao'): ?>
                                        <span class="status-otisao"><?php echo htmlspecialchars($row['status_u_klubu']); ?></span>
                                    <?php else: ?>
                                        <span class="status-aktivan"><?php echo htmlspecialchars($row['status_u_klubu']); ?></span>
                                    <?php endif; ?>
                                </td>
                            </tr>
                        <?php endwhile; ?>
                    <?php else: ?>
                        <tr><td colspan="3">Nema podataka o osoblju.</td></tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>
</section>

<?php
$conn->close();
include 'includes/footer.php';
?>