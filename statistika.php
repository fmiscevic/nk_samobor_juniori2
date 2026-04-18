<?php
include 'includes/db.php';
include 'includes/header.php';

$sql_statistika = "SELECT
                    COUNT(*) AS odigrane_utakmice,
                    SUM(CASE WHEN golovi_samobor > golovi_protivnik THEN 1 ELSE 0 END) AS pobjede,
                    SUM(CASE WHEN golovi_samobor = golovi_protivnik THEN 1 ELSE 0 END) AS nerijeseno,
                    SUM(CASE WHEN golovi_samobor < golovi_protivnik THEN 1 ELSE 0 END) AS porazi,
                    SUM(golovi_samobor) AS postignuti_golovi,
                    SUM(golovi_protivnik) AS primljeni_golovi,
                    SUM(golovi_samobor) - SUM(golovi_protivnik) AS gol_razlika,
                    SUM(
                        CASE
                            WHEN golovi_samobor > golovi_protivnik THEN 3
                            WHEN golovi_samobor = golovi_protivnik THEN 1
                            ELSE 0
                        END
                    ) AS bodovi
                  FROM utakmice
                  WHERE golovi_samobor IS NOT NULL
                    AND golovi_protivnik IS NOT NULL";
$result_statistika = $conn->query($sql_statistika);
$stat = $result_statistika ? $result_statistika->fetch_assoc() : null;

$sql_top_strijelci = "SELECT ime, prezime, golovi
                      FROM igraci
                      ORDER BY golovi DESC, prezime ASC, ime ASC
                      LIMIT 5";
$result_top_strijelci = $conn->query($sql_top_strijelci);

$sql_top_nastupi = "SELECT ime, prezime, broj_nastupa, broj_minuta
                    FROM igraci
                    ORDER BY broj_nastupa DESC, broj_minuta DESC, prezime ASC, ime ASC
                    LIMIT 5";
$result_top_nastupi = $conn->query($sql_top_nastupi);

$sql_top_minute = "SELECT ime, prezime, broj_minuta, broj_nastupa
                   FROM igraci
                   ORDER BY broj_minuta DESC, broj_nastupa DESC, prezime ASC, ime ASC
                   LIMIT 5";
$result_top_minute = $conn->query($sql_top_minute);
?>

<section class="section">
    <div class="container">
        <h2 class="section-title">Statistika ekipe</h2>
        <p class="section-text">
            Na ovoj stranici nalazi se pregled najvažnijih natjecateljskih pokazatelja ekipe kroz sezonu,
            uključujući rezultate, bodovni učinak, gol-razliku te poredak igrača prema golovima,
            nastupima i odigranim minutama.
        </p>
        <p class="section-text">
            Statistika omogućuje jednostavan uvid u učinak ekipe i pojedinaca te pomaže u praćenju
            kontinuiteta nastupa i doprinosa igrača tijekom sezone.
        </p>

        <div class="team-section-image" style="margin-top: 28px;">
            <img src="images/ekipa/ekipa-statistika.jpg?v=2" alt="Ekipa NK Samobor" class="team-image">
        </div>
    </div>
</section>

<section class="section">
    <div class="container table-card">
        <h3 class="table-title">Sažetak ekipe</h3>
        <div class="table-wrap no-scroll">
            <table class="modern-table compact-table">
                <thead>
                    <tr>
                        <th>Odigrane</th>
                        <th>Pobjede</th>
                        <th>Neriješeno</th>
                        <th>Porazi</th>
                        <th>Zabijeni</th>
                        <th>Primljeni</th>
                        <th>Gol razlika</th>
                        <th>Bodovi</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><?php echo htmlspecialchars($stat['odigrane_utakmice'] ?? 0); ?></td>
                        <td><?php echo htmlspecialchars($stat['pobjede'] ?? 0); ?></td>
                        <td><?php echo htmlspecialchars($stat['nerijeseno'] ?? 0); ?></td>
                        <td><?php echo htmlspecialchars($stat['porazi'] ?? 0); ?></td>
                        <td><?php echo htmlspecialchars($stat['postignuti_golovi'] ?? 0); ?></td>
                        <td><?php echo htmlspecialchars($stat['primljeni_golovi'] ?? 0); ?></td>
                        <td><?php echo htmlspecialchars($stat['gol_razlika'] ?? 0); ?></td>
                        <td><?php echo htmlspecialchars($stat['bodovi'] ?? 0); ?></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>

<section class="section">
    <div class="container cards-3">
        <div class="table-card">
            <h3 class="table-title">Top 5 strijelaca</h3>
            <div class="table-wrap no-scroll">
                <table class="modern-table compact-table">
                    <thead>
                        <tr>
                            <th>Igrač</th>
                            <th>Golovi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php while ($row = $result_top_strijelci->fetch_assoc()): ?>
                            <tr>
                                <td><?php echo htmlspecialchars($row['ime'] . ' ' . $row['prezime']); ?></td>
                                <td><?php echo htmlspecialchars($row['golovi']); ?></td>
                            </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="table-card">
            <h3 class="table-title">Top 5 po nastupima</h3>
            <div class="table-wrap no-scroll">
                <table class="modern-table compact-table">
                    <thead>
                        <tr>
                            <th>Igrač</th>
                            <th>Nastupi</th>
                            <th>Minute</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php while ($row = $result_top_nastupi->fetch_assoc()): ?>
                            <tr>
                                <td><?php echo htmlspecialchars($row['ime'] . ' ' . $row['prezime']); ?></td>
                                <td><?php echo htmlspecialchars($row['broj_nastupa']); ?></td>
                                <td><?php echo htmlspecialchars($row['broj_minuta']); ?></td>
                            </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="table-card">
            <h3 class="table-title">Top 5 po minutama</h3>
            <div class="table-wrap no-scroll">
                <table class="modern-table compact-table">
                    <thead>
                        <tr>
                            <th>Igrač</th>
                            <th>Minute</th>
                            <th>Nastupi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php while ($row = $result_top_minute->fetch_assoc()): ?>
                            <tr>
                                <td><?php echo htmlspecialchars($row['ime'] . ' ' . $row['prezime']); ?></td>
                                <td><?php echo htmlspecialchars($row['broj_minuta']); ?></td>
                                <td><?php echo htmlspecialchars($row['broj_nastupa']); ?></td>
                            </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>

<?php
$conn->close();
include 'includes/footer.php';
?>