1;
args = argv();

function extract(path, blockNum)
    blockNum = int2str(blockNum);
    quambo;
    PopAnalysis;
    % H1 is diagonalized, OrbMat is un-diagonalized orbital matrix
    H1 = QMB.H;
    S = QMB.S;
    sqrtS = sqrtm(S);
    OrbMat = sqrtS * H1 * sqrtS;
    AtomDist = Atom.dist;
    BondMat = bondmatrix(OrbMat, 1, 2, 3);
    locMat = Atom.X;
    AtomCharge = QMB.Charge;
    orbFile = strcat(path, "/orbitals", blockNum, ".mat");
    distFile = strcat(path, "/distances", blockNum, ".mat");
    bondFile = strcat(path, "/bondmatrix", blockNum, ".mat");
    locFile = strcat(path, "/locations", blockNum, ".mat");
    chgFile = strcat(path, "/charges", blockNum, ".mat");
    save(orbFile, "OrbMat");
    save(distFile, "AtomDist");
    save(bondFile, "BondMat");
    save(locFile, "locMat");
    save(chgFile, "AtomCharge");
endfunction
extract(args{1}, args{2});
