<?php
include 'includes/db.php';
include 'includes/header.php';

function logoKluba($protivnik) {
    $naziv = mb_strtolower(trim($protivnik));

    $map = [
        'nk sesvete' => 'images/klubovi/nk-sesvete.png',
        'gnk dinamo' => 'images/klubovi/gnk-dinamo.png',
        'nk vrapče' => 'images/klubovi/nk-vrapce.png',
        'hnk gorica s.d.d.' => 'images/klubovi/hnk-gorica.png',
        'nk lokomotiva (z)' => 'images/klubovi/nk-lokomotiva.png',
        'nk špansko' => 'images/klubovi/nk-spansko.png',
        'nk rudeš' => 'images/klubovi/nk-rudes.png',
        'nk maksimir' => 'images/klubovi/nk-maksimir.png',
        'nk ponikve' => 'images/klubovi/nk-ponikve.png',
        'nk zagreb city' => 'images/klubovi/nk-zagreb-city.png',
        'nk hrvatski dragovoljac (z)' => 'images/klubovi/nk-hrvatski-dragovoljac.png',
        'nk kurilovec' => 'images/klubovi/nk-kurilovec.png',
        'nk hašk' => 'images/klubovi/nk-hask.png',
        'nk trešnjevka' => 'images/klubovi/nk-tresnjevka.png',
        'nk kustošija' => 'images/klubovi/nk-kustosija.png'
    ];

    return $map[$naziv] ?? 'images/placeholders/club-placeholder.png';
}

$sql_odigrane = "SELECT *
                 FROM utakmice
                 WHERE golovi_samobor IS NOT NULL AND golovi_protivnik IS NOT NULL
                 ORDER BY kolo ASC";
$result_odigrane = $conn->query($sql_odigrane);

$sql_buduce = "SELECT *
               FROM utakmice
               WHERE golovi_samobor IS NULL AND golovi_protivnik IS NULL
               ORDER BY kolo ASC";
$result_buduce = $conn->query($sql_buduce);
?>

<section class="section">
    <div class="container table-card">
        <h2 class="table-title">Utakmice</h2>
        <p class="table-subtitle">Pregled odigranih i nadolazećih utakmica ekipe NK Samobor - Juniori 2.</p>

        <div class="table-wrap no-scroll">
            <table class="modern-table compact-table">
                <thead>
                    <tr>
                        <th>Kolo</th>
                        <th>Protivnik</th>
                        <th>Datum i vrijeme</th>
                        <th>Lokacija</th>
                        <th>Status</th>
                        <th>Rezultat</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if ($result_odigrane && $result_odigrane->num_rows > 0): ?>
                        <?php while ($row = $result_odigrane->fetch_assoc()): ?>
                            <tr>
                                <td><?php echo htmlspecialchars($row['kolo']); ?></td>
                                <td>
                                    <div class="club-cell">
                                        <img src="<?php echo htmlspecialchars(logoKluba($row['protivnik'])); ?>" alt="Grb kluba" class="club-logo">
                                        <strong><?php echo htmlspecialchars($row['protivnik']); ?></strong>
                                    </div>
                                </td>
                                <td><?php echo htmlspecialchars($row['datum_vrijeme']); ?></td>
                                <td><?php echo htmlspecialchars($row['lokacija']); ?></td>
                                <td>
                                    <?php if ($row['domacin_gost'] === 'Domaćin'): ?>
                                        <span class="badge-home">Domaćin</span>
                                    <?php else: ?>
                                        <span class="badge-away">Gost</span>
                                    <?php endif; ?>
                                </td>
                                <td><span class="result-pill"><?php echo htmlspecialchars($row['golovi_samobor'] . ':' . $row['golovi_protivnik']); ?></span></td>
                            </tr>
                        <?php endwhile; ?>
                    <?php else: ?>
                        <tr><td colspan="6">Nema odigranih utakmica.</td></tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>
</section>

<section class="section">
    <div class="container table-card">
        <h3 class="table-title">Nadolazeće utakmice</h3>
        <p class="table-subtitle">Raspored preostalih kola.</p>

        <div class="table-wrap no-scroll">
            <table class="modern-table compact-table">
                <thead>
                    <tr>
                        <th>Kolo</th>
                        <th>Protivnik</th>
                        <th>Datum i vrijeme</th>
                        <th>Lokacija</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if ($result_buduce && $result_buduce->num_rows > 0): ?>
                        <?php while ($row = $result_buduce->fetch_assoc()): ?>
                            <tr>
                                <td><?php echo htmlspecialchars($row['kolo']); ?></td>
                                <td>
                                    <div class="club-cell">
                                        <img src="<?php echo htmlspecialchars(logoKluba($row['protivnik'])); ?>" alt="Grb kluba" class="club-logo">
                                        <strong><?php echo htmlspecialchars($row['protivnik']); ?></strong>
                                    </div>
                                </td>
                                <td><?php echo htmlspecialchars($row['datum_vrijeme']); ?></td>
                                <td><?php echo htmlspecialchars($row['lokacija']); ?></td>
                                <td>
                                    <?php if ($row['domacin_gost'] === 'Domaćin'): ?>
                                        <span class="badge-home">Domaćin</span>
                                    <?php else: ?>
                                        <span class="badge-away">Gost</span>
                                    <?php endif; ?>
                                </td>
                            </tr>
                        <?php endwhile; ?>
                    <?php else: ?>
                        <tr><td colspan="5">Nema nadolazećih utakmica.</td></tr>
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