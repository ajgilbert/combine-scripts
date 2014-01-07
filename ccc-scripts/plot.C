
  void SetHTTStyle() {
    TStyle *HttStyle = new TStyle("Htt-Style","The Perfect Style for Plots ;-)");
    gStyle = HttStyle;

    // Canvas
    HttStyle->SetCanvasColor     (0);
    HttStyle->SetCanvasBorderSize(10);
    HttStyle->SetCanvasBorderMode(0);
    HttStyle->SetCanvasDefH      (600);
    HttStyle->SetCanvasDefW      (600);
    HttStyle->SetCanvasDefX      (100);
    HttStyle->SetCanvasDefY      (100);

    // color palette for 2D temperature plots
    HttStyle->SetPalette(1,0);
    
    // Pads
    HttStyle->SetPadColor       (0);
    HttStyle->SetPadBorderSize  (10);
    HttStyle->SetPadBorderMode  (0);
    HttStyle->SetPadBottomMargin(0.13);
    HttStyle->SetPadTopMargin   (0.08);
    HttStyle->SetPadLeftMargin  (0.15);
    HttStyle->SetPadRightMargin (0.05);
    HttStyle->SetPadGridX       (0);
    HttStyle->SetPadGridY       (0);
    HttStyle->SetPadTickX       (1);
    HttStyle->SetPadTickY       (1);

    // Frames
    HttStyle->SetLineWidth(3);
    HttStyle->SetFrameFillStyle ( 0);
    HttStyle->SetFrameFillColor ( 0);
    HttStyle->SetFrameLineColor ( 1);
    HttStyle->SetFrameLineStyle ( 0);
    HttStyle->SetFrameLineWidth ( 2);
    HttStyle->SetFrameBorderSize(10);
    HttStyle->SetFrameBorderMode( 0);

    // Histograms
    HttStyle->SetHistFillColor(2);
    HttStyle->SetHistFillStyle(0);
    HttStyle->SetHistLineColor(1);
    HttStyle->SetHistLineStyle(0);
    HttStyle->SetHistLineWidth(3);
    HttStyle->SetNdivisions(510);

    // Functions
    HttStyle->SetFuncColor(1);
    HttStyle->SetFuncStyle(0);
    HttStyle->SetFuncWidth(2);

    // Various
    HttStyle->SetMarkerStyle(20);
    HttStyle->SetMarkerColor(kBlack);
    HttStyle->SetMarkerSize (1.1);

    HttStyle->SetTitleBorderSize(0);
    HttStyle->SetTitleFillColor (0);
    HttStyle->SetTitleX         (0.2);

    HttStyle->SetTitleSize  (0.055,"X");
    HttStyle->SetTitleOffset(1.000,"X");
    HttStyle->SetLabelOffset(0.005,"X");
    HttStyle->SetLabelSize  (0.040,"X");
    HttStyle->SetLabelFont  (42   ,"X");

    HttStyle->SetStripDecimals(kFALSE);
    HttStyle->SetLineStyleString(11,"20 10");

    HttStyle->SetTitleSize  (0.055,"Y");
    HttStyle->SetTitleOffset(1.200,"Y");
    HttStyle->SetLabelOffset(0.010,"Y");
    HttStyle->SetLabelSize  (0.040,"Y");
    HttStyle->SetLabelFont  (42   ,"Y");

    HttStyle->SetOptTitle(0);


    HttStyle->SetTextSize   (0.055);
    HttStyle->SetTextFont   (42);

    HttStyle->SetStatFont   (42);
    HttStyle->SetTitleFont  (42);
    HttStyle->SetTitleFont  (42,"X");
    HttStyle->SetTitleFont  (42,"Y");
    HttStyle->SetEndErrorSize(0);


    HttStyle->SetOptStat    (0);

    gROOT->ForceStyle();
    return;

  }


void plot() {
  SetHTTStyle();
  TFile toy_file("higgsCombineTest.ChannelCompatibilityCheck.mH125.toys.root");
  TTree *toy_tree = (TTree*)toy_file.Get("limit");
  TFile obs_file("higgsCombineTest.ChannelCompatibilityCheck.mH125.root");
  TTree *obs_tree = (TTree*)obs_file.Get("limit");

  double val_toys;
  double val_obs;
  unsigned ntoys;
  unsigned nvalid;
  int n_gt;

  toy_tree->SetBranchAddress("limit",&val_toys);
  obs_tree->SetBranchAddress("limit",&val_obs);
  double max=0.0;
  for (int i = 0; i < toy_tree->GetEntries(); ++i) {
    toy_tree->GetEntry(i);
    if (val_toys > max) max = val_toys;
  }
  obs_tree->GetEntry(0);



  
  TH1F toy_hist("toy_hist","toy_hist",int(double(toy_tree->GetEntries())/70.),0,max);
  for (int i = 0; i < toy_tree->GetEntries(); ++i) {
    ++ntoys;
    if (val_toys > 0) {
      ++nvalid;
      if (val_toys > val_obs) ++n_gt;
    }
    toy_tree->GetEntry(i);
    toy_hist.Fill(val_toys); 
  }
  toy_hist.GetXaxis()->SetTitle("Channel Compatibility (#chi^{2}-like)");
  toy_hist.GetYaxis()->SetTitle("Toys");

  TCanvas canv("canvas","cavas",600,600);
  canv.cd();
  toy_hist.Draw();
  double pval = toy_hist.Integral(toy_hist.GetXaxis()->FindBin(val_obs), toy_hist.GetNbinsX());
  double tot = toy_hist.Integral(1,toy_hist.GetNbinsX());
  std::cout << "ntoys: " << ntoys << std::endl;
  std::cout << "nvalid: " << nvalid << std::endl;
  std::cout << "ngt: " << n_gt << std::endl;
  std::cout << "p-val: " << pval/tot << std::endl;
  std::cout << "p-val: " << double(n_gt)/double(nvalid) << std::endl;
  double better_pval = double(n_gt)/double(nvalid);

  TLatex *title_latex = new TLatex();
  title_latex->SetNDC();
  if (true) {
    title_latex->SetTextSize(0.035);
    title_latex->SetTextFont(62);
    title_latex->SetTextAlign(11);
    title_latex->DrawLatex(0.15,0.94,"CMS H#rightarrow#tau#tau, up to 4.9 fb^{-1} at 7 TeV, 19.7 fb^{-1} at 8 TeV");
    title_latex->SetTextAlign(31);
    title_latex->SetTextSize(0.06);
    title_latex->DrawLatex(0.9,0.83,TString::Format("P(#chi^{2}>obs) = %.2f", better_pval).Data());


  }
  

  TArrow arrow(val_obs,0,val_obs,toy_hist.GetMaximum()/3.,0.05,"<");
  arrow.SetLineColor(2);
  arrow.SetLineWidth(4);
  arrow.Draw();
  canv.SaveAs("ccc.pdf");
  canv.SaveAs("ccc.png");



}
