{

 TFile f("scan-CV-versus-CF.root");
 f.cd();
 gDirectory->cd("cmb");
 TH2F *h = (TH2F*)gDirectory->Get("plot2D_125");


 // 2D significance
 double signif_2d = ROOT::Math::gaussian_quantile_c(TMath::Prob(h->Interpolate(0.,0.)*2.0,2)/2.0,1);
 std::cout << "Interpolated NLL: " << h->Interpolate(0.,0.) << std::endl;
 std::cout << "2D significance: " << signif_2d << std::endl;
 TH1F *out = new TH1F("kf-scan","kf-scan",h->GetNbinsY(),h->GetYaxis()->GetXmin(),h->GetYaxis()->GetXmax());

 

 for (unsigned j = 1; j <= h->GetNbinsY(); ++j) {
 double min = 99999999;
 int bin = -1;

 for (unsigned i = 1; i <= h->GetNbinsX(); ++i) {
  if (h->GetBinContent(i,j) < min && h->GetBinContent(i,j) != 0.0 ) {
    min = h->GetBinContent(i,j);
    bin = i;
  }
 }
 out->SetBinContent(j,min);

 std::cout << "Minimum found for NLL: " << min << " at kV = " << h->GetXaxis()->GetBinCenter(bin) << std::endl;
 }


 double interp = out->Interpolate(0.0);
 double prob = TMath::Prob(interp*2.0, 1);

 double signif = ROOT::Math::gaussian_quantile_c(prob/2.0, 1.0);

 std::cout << "Interpolated NLL: " << interp << std::endl;
 std::cout << "Probability(2NLL): " << prob << std::endl;
 std::cout << "Significance: " << signif << std::endl;

 

 TFile output("kf-scan.root","RECREATE");
 output.cd();
 out->Write();
 TCanvas canv("kf","kf",600,600);
 out->Draw();
 canv->SaveAs("kf-scan.pdf");
 output.Close();



}
