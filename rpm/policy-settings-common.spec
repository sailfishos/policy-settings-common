Name:       policy-settings-common
Summary:    Common policy settings
Version:    1
Release:    1
Group:      Configs
License:    GPLv2
Source0:    %{name}-%{version}.tar.bz2
BuildRequires:  automake
BuildRequires:  libtool
BuildRequires:  libdres-utils >= 1.1.13
BuildRequires:  swi-prolog
BuildRequires:  swi-prolog-library
BuildRequires:  libprolog
BuildRequires:  prolog-resourcepolicy-extensions

%description
%{summary}.

%package -n policy-settings-common-text
Summary:    Common policy settings sources

%description -n policy-settings-common-text
%{summary}

%prep
%setup -q -n %{name}-%{version}

%build
rm -f dummy.h* basic/policy/policy.plc
%autogen --disable-static
%configure
make -j1

%install
rm -rf %{buildroot}
make DESTDIR=%{buildroot} INSTALL_SYMLINKS=1 install

%post

%files
%defattr(-,root,root,-)
%{_datadir}/policy/rules/current
%{_datadir}/policy/rules/basic/policy.plc
%{_datadir}/policy/rules/basic/policy.dres
%dir %{_datadir}/policy
%dir %{_datadir}/policy/rules
%dir %{_datadir}/policy/rules/basic

%files -n policy-settings-common-text
%defattr(-,root,root,-)
%{_datadir}/policy/rules/current
%{_datadir}/policy/rules/basic/*.pl
%{_datadir}/policy/rules/basic/*.dres
