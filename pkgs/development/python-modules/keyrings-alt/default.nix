{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder
, isPy27
, six

, pytestCheckHook
, keyring
, setuptools-scm
}:

buildPythonPackage rec {
  pname = "keyrings-alt";
  version = "4.2.0";
  format = "pyproject";
  disabled = isPy27;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-K6PVZEG6Bjf1+cCWBo9nAQrART+dC2Jt4qowGTU7ZDE=";
  };

  nativeBuildInputs = [
    setuptools-scm
  ];

  propagatedBuildInputs = [
    six
  ];

  nativeCheckInputs = [
    pytestCheckHook
    keyring
  ];

  pythonImportsCheck = [
    "keyrings.alt"
  ];

  meta = with lib; {
    description = "Alternate keyring implementations";
    homepage = "https://github.com/jaraco/keyrings.alt";
    changelog = "https://github.com/jaraco/keyrings.alt/blob/v${version}/NEWS.rst";
    license = licenses.mit;
    maintainers = with maintainers; [ nyarly ];
  };
}
