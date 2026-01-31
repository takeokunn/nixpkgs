{
  lib,
  buildGoModule,
  fetchFromGitHub,
  nix-update-script,
}:

buildGoModule rec {
  pname = "gogcli";
  version = "0.9.0";

  src = fetchFromGitHub {
    owner = "steipete";
    repo = "gogcli";
    tag = "v${version}";
    hash = "sha256-DXRw5jf/5fC8rgwLIy5m9qkxy3zQNrUpVG5C0RV7zKM=";
  };

  vendorHash = "sha256-nig3GI7eM1XRtIoAh1qH+9PxPPGynl01dCZ2ppyhmzU=";

  ldflags = [
    "-s"
    "-w"
  ];

  doCheck = false; # Tests require network access to Google APIs

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Fast, script-friendly CLI for Google Workspace (Gmail, Calendar, Chat, Drive, Docs, Sheets, Tasks) with JSON output";
    homepage = "https://github.com/steipete/gogcli";
    changelog = "https://github.com/steipete/gogcli/releases/tag/v${version}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ takeokunn ];
    mainProgram = "gog";
  };
}
