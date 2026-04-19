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

$sql_zadnja = "SELECT kolo, datum_vrijeme, protivnik, golovi_samobor, golovi_protivnik
               FROM utakmice
               WHERE golovi_samobor IS NOT NULL AND golovi_protivnik IS NOT NULL
               ORDER BY datum_vrijeme DESC
               LIMIT 1";
$result_zadnja = $conn->query($sql_zadnja);
$zadnja = $result_zadnja ? $result_zadnja->fetch_assoc() : null;

$sql_sljedeca = "SELECT kolo, datum_vrijeme, protivnik, lokacija, domacin_gost
                 FROM utakmice
                 WHERE datum_vrijeme > NOW()
                 ORDER BY datum_vrijeme ASC
                 LIMIT 1";
$result_sljedeca = $conn->query($sql_sljedeca);
$sljedeca = $result_sljedeca ? $result_sljedeca->fetch_assoc() : null;

$sql_statistika = "SELECT
                    COUNT(*) AS odigrane_utakmice,
                    SUM(CASE WHEN golovi_samobor > golovi_protivnik THEN 1 ELSE 0 END) AS pobjede,
                    SUM(CASE WHEN golovi_samobor = golovi_protivnik THEN 1 ELSE 0 END) AS nerijeseno,
                    SUM(CASE WHEN golovi_samobor < golovi_protivnik THEN 1 ELSE 0 END) AS porazi,
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
?>

<section class="hero">
    <div class="hero-bg"></div>
    <div class="container hero-content">
        <span class="hero-badge">PRVA NL CENTAR JUNIORI 25/26</span>
        <h1>NK Samobor - Juniori 2</h1>
        <p>
            NK Samobor je klub duge tradicije i važan dio sportskog identiteta grada Samobora, a kroz
            generacije mladih igrača gradi zajedništvo, radne navike i ljubav prema nogometu.
            Ova stranica posvećena je ekipi Juniori 2 te donosi pregled igrača, utakmica, statistike i
            najvažnijih informacija vezanih uz njihov natjecateljski put.
        </p>
        <div class="hero-actions">
            <a href="o-ekipi.php" class="btn-primary">Više o ekipi &raquo;</a>
            <a href="utakmice.php" class="btn-secondary">Pogledaj utakmice</a>
        </div>
    </div>
</section>

<section class="section" id="o-klubu">
    <div class="container">
        <h2 class="section-title">O klubu i ekipi</h2>
        <p class="section-text">
            NK Samobor jedan je od prepoznatljivih sportskih simbola grada i klub bogate tradicije koji
            već desetljećima okuplja djecu, mlade i seniore kroz organizirani nogometni rad. Kroz školu
            nogometa i natjecateljske selekcije klub razvija sportski duh, odgovornost, zajedništvo i
            pripadnost lokalnoj sredini.
        </p>    
        <p class="section-text">
            Na ovoj stranici nalazi se pregled ekipe Juniori 2 za sezonu 2025./2026., uključujući popis
            igrača, rezultate i raspored utakmica, pregled osoblja, statistiku ekipe te osnovne informacije
            o klubu i sportskoj infrastrukturi. Cilj stranice je na jednom mjestu prikazati najvažnije
            informacije o ekipi i njezinu nastupu tijekom sezone.
        </p>

        <div class="stats-grid" style="margin-top:28px;">
            <div class="stat-card">
                <div class="number"><?php echo htmlspecialchars($stat['odigrane_utakmice'] ?? 0); ?></div>
                <div class="label">Odigrane utakmice</div>
            </div>
            <div class="stat-card">
                <div class="number"><?php echo htmlspecialchars($stat['pobjede'] ?? 0); ?></div>
                <div class="label">Pobjede</div>
            </div>
            <div class="stat-card">
                <div class="number"><?php echo htmlspecialchars($stat['nerijeseno'] ?? 0); ?></div>
                <div class="label">Neriješeno</div>
            </div>
            <div class="stat-card">
                <div class="number"><?php echo htmlspecialchars($stat['bodovi'] ?? 0); ?></div>
                <div class="label">Bodovi</div>
            </div>
        </div>
    </div>
</section>

<section class="section">
    <div class="container cards-2">
        <div class="info-card">
            <h3>Zadnja utakmica</h3>
            <?php if ($zadnja): ?>
                <div class="match-card">
                    <img src="<?php echo htmlspecialchars(logoKluba($zadnja['protivnik'])); ?>" alt="Grb kluba" class="match-logo">
                    <div>
                        <p><strong>Kolo:</strong> <?php echo htmlspecialchars($zadnja['kolo']); ?></p>
                        <p><strong>Protivnik:</strong> <?php echo htmlspecialchars($zadnja['protivnik']); ?></p>
                        <p><strong>Rezultat:</strong> <?php echo htmlspecialchars($zadnja['golovi_samobor'] . ':' . $zadnja['golovi_protivnik']); ?></p>
                        <p><strong>Status:</strong> Odigrano </p>
                        <p><strong>Datum:</strong> <?php echo htmlspecialchars($zadnja['datum_vrijeme']); ?></p>
                    </div>
                </div>
            <?php else: ?>
                <p>Nema dostupnih podataka.</p>
            <?php endif; ?>
        </div>

        <div class="info-card">
            <h3>Sljedeća utakmica</h3>
            <?php if ($sljedeca): ?>
                <div class="match-card">
                    <img src="<?php echo htmlspecialchars(logoKluba($sljedeca['protivnik'])); ?>" alt="Grb kluba" class="match-logo">
                    <div>
                        <p><strong>Kolo:</strong> <?php echo htmlspecialchars($sljedeca['kolo']); ?></p>
                        <p><strong>Protivnik:</strong> <?php echo htmlspecialchars($sljedeca['protivnik']); ?></p>
                        <p><strong>Lokacija:</strong> <?php echo htmlspecialchars($sljedeca['lokacija']); ?></p>
                        <p><strong>Status:</strong> <?php echo htmlspecialchars($sljedeca['domacin_gost']); ?></p>
                        <p><strong>Datum:</strong> <?php echo htmlspecialchars($sljedeca['datum_vrijeme']); ?></p>
                    </div>
                </div>
            <?php else: ?>
                <p>Trenutno nema nadolazeće utakmice.</p>
            <?php endif; ?>
        </div>
    </div>
</section>

<section class="section" id="tereni">
    <div class="container">
        <h2 class="section-title">Tereni i sportska infrastruktura</h2>
        <p class="section-text">
            Klub koristi više terena koji omogućuju kvalitetan trenažni i natjecateljski rad.
        </p>

        <div class="slider">
            <button class="slider-btn prev">&#10094;</button>
            <div class="slider-track">
                <div class="slide">
                    <img src="images/tereni/glavni-teren.jpg" alt="Glavni teren">
                    <div class="slide-caption">
                        <h3>Glavni teren</h3>
                        <p>Glavni teren služi za domaće utakmice i najvažnije treninge ekipe.</p>
                    </div>
                </div>
                <div class="slide">
                    <img src="images/tereni/pomocni-teren.jpg" alt="Pomoćni teren">
                    <div class="slide-caption">
                        <h3>Pomoćni teren</h3>
                        <p>Pomoćni teren koristi se za treninge i utakmice mlađih uzrasta, većinom pionira.</p>
                    </div>
                </div>
                <div class="slide">
                    <img src="images/tereni/umjetna-trava.jpg" alt="Umjetna trava">
                    <div class="slide-caption">
                        <h3>Umjetna trava</h3>
                        <p>Umjetna trava koristi se za treninge i utakmice klubskih najmlađih skupina.</p>
                    </div>
                </div>
            </div>
            <button class="slider-btn next">&#10095;</button>
        </div>
    </div>
</section>

<section class="section">
    <div class="container">
        <h2 class="section-title">Dresovi ekipe</h2>
        <div class="kits-grid">
            <div class="kit-card">
                <img src="images/dresovi/domaci-plavi.jpg" alt="Glavni dres">
                <h3>Glavni dres</h3>
                <p>Plavi dres predstavlja glavni identitet ekipe i boje kluba.</p>
            </div>
            <div class="kit-card">
                <img src="images/dresovi/gostujuci-zuti.jpg" alt="Gostujući dres">
                <h3>Gostujući dres</h3>
                <p>Žuti dres koristi se na gostovanjima i kao alternativna varijanta.</p>
            </div>
        </div>
    </div>
</section>

<section class="section">
    <div class="container">
        <h2 class="section-title">Momčad</h2>
        <p class="section-text">
            Na donjoj fotografiji nalazi se ekipa NK Samobor - Juniori 2.
        </p>
        <div class="team-section-image">
            <img src="images/ekipa/ekipa.jpg?v=2" alt="Ekipa NK Samobor Juniori 2" class="team-image">
        </div>
    </div>
</section>

<?php
$conn->close();
include 'includes/footer.php';
?>