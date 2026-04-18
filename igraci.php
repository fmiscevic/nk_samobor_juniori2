<?php
include 'includes/db.php';
include 'includes/header.php';

$sql = "SELECT ime, prezime, godiste, broj_dresa, primarna_pozicija, alternativna_pozicija,
               golovi, zuti_kartoni, crveni_kartoni, broj_nastupa, broj_minuta,
               zapoceo_utakmicu, usao_s_klupe, status_u_klubu
        FROM igraci
        ORDER BY prezime, ime";
$result = $conn->query($sql);
?>

<section class="section">
    <div class="container table-card">
        <h2 class="table-title">Igrači</h2>
        <p class="table-subtitle">Pregled svih igrača koji su tijekom sezone bili ili jesu dio ekipe.</p>

        <div class="table-wrap no-scroll">
            <table class="modern-table compact-table">
                <thead>
                    <tr>
                        <th>Ime i prezime</th>
                        <th>Godište</th>
                        <th>Dres</th>
                        <th>Primarna</th>
                        <th>Alternativna</th>
                        <th>G</th>
                        <th>Ž</th>
                        <th>C</th>
                        <th>Nastupi</th>
                        <th>Minute</th>
                        <th>Početna</th>
                        <th>S klupe</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if ($result && $result->num_rows > 0): ?>
                        <?php while ($row = $result->fetch_assoc()): ?>
                            <tr>
                                <td class="simple-name"><?php echo htmlspecialchars($row['ime'] . ' ' . $row['prezime']); ?></td>
                                <td><?php echo htmlspecialchars($row['godiste']); ?></td>
                                <td><?php echo htmlspecialchars($row['broj_dresa']); ?></td>
                                <td><?php echo htmlspecialchars($row['primarna_pozicija']); ?></td>
                                <td><?php echo htmlspecialchars($row['alternativna_pozicija']); ?></td>
                                <td><?php echo htmlspecialchars($row['golovi']); ?></td>
                                <td><?php echo htmlspecialchars($row['zuti_kartoni']); ?></td>
                                <td><?php echo htmlspecialchars($row['crveni_kartoni']); ?></td>
                                <td><?php echo htmlspecialchars($row['broj_nastupa']); ?></td>
                                <td><?php echo htmlspecialchars($row['broj_minuta']); ?></td>
                                <td><?php echo htmlspecialchars($row['zapoceo_utakmicu']); ?></td>
                                <td><?php echo htmlspecialchars($row['usao_s_klupe']); ?></td>
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
                        <tr><td colspan="13">Nema podataka o igračima.</td></tr>
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