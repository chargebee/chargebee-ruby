.PHONY: update-version increment-major increment-minor increment-patch test build clean install check format

# Version file location
VERSION_FILE := VERSION
GEMSPEC_FILE := chargebee.gemspec
LIB_FILE := lib/chargebee.rb

# Ruby commands
RUBY := ruby
GEM := gem
BUNDLE := bundle
RSPEC := bundle exec rspec

update-version:
	@echo "$(VERSION)" > $(VERSION_FILE)
	@perl -pi -e 's|s\.version\s*=\s*'\''[.\-\d\w]+'\''|s.version           = '\''$(VERSION)'\''|' $(GEMSPEC_FILE)
	@perl -pi -e 's|VERSION = '\''[.\-\d\w]+'\''|VERSION = '\''$(VERSION)'\''|' $(LIB_FILE)
	@perl -pi -e "s|s\\.date\\s*=\\s*'[^']*'|s.date              = '$(shell date +%Y-%m-%d)'|" $(GEMSPEC_FILE)
	@echo "Updated version to $(VERSION) and date to $(shell date +%Y-%m-%d)"
	@if [ -f "Gemfile.lock" ]; then \
		echo "Updating Gemfile.lock..."; \
		$(BUNDLE) install --quiet; \
	fi

increment-major:
	$(eval CURRENT := $(shell cat $(VERSION_FILE)))
	$(eval MAJOR := $(shell echo $(CURRENT) | cut -d. -f1))
	$(eval NEW_VERSION := $(shell echo $$(($(MAJOR) + 1)).0.0))
	@$(MAKE) update-version VERSION=$(NEW_VERSION)
	@echo "Version bumped from $(CURRENT) to $(NEW_VERSION)"

increment-minor:
	$(eval CURRENT := $(shell cat $(VERSION_FILE)))
	$(eval MAJOR := $(shell echo $(CURRENT) | cut -d. -f1))
	$(eval MINOR := $(shell echo $(CURRENT) | cut -d. -f2))
	$(eval NEW_VERSION := $(MAJOR).$(shell echo $$(($(MINOR) + 1))).0)
	@$(MAKE) update-version VERSION=$(NEW_VERSION)
	@echo "Version bumped from $(CURRENT) to $(NEW_VERSION)"

increment-patch:
	$(eval CURRENT := $(shell cat $(VERSION_FILE)))
	$(eval MAJOR := $(shell echo $(CURRENT) | cut -d. -f1))
	$(eval MINOR := $(shell echo $(CURRENT) | cut -d. -f2))
	$(eval PATCH := $(shell echo $(CURRENT) | cut -d. -f3))
	$(eval NEW_VERSION := $(MAJOR).$(MINOR).$(shell echo $$(($(PATCH) + 1))))
	@$(MAKE) update-version VERSION=$(NEW_VERSION)
	@echo "Version bumped from $(CURRENT) to $(NEW_VERSION)"

install:
	@echo "Installing dependencies..."
	@$(BUNDLE) install --without development

install-dev:
	@echo "Installing development dependencies..."
	@$(BUNDLE) install

test:
	@echo "Running tests..."
	@$(RSPEC)

validate:
	@echo "Validating gemspec..."
	@$(GEM) build $(GEMSPEC_FILE) --strict --verbose > /dev/null
	@rm -f *.gem
	@echo "Gemspec is valid"

check: test
	@echo "All checks passed!"

build: clean update-manifest
	@echo "Building gem..."
	@$(GEM) build $(GEMSPEC_FILE)

clean:
	@echo "Cleaning build artifacts..."
	@rm -f *.gem
	@rm -rf pkg/
	@rm -rf coverage/
	@find . -type f -name '.DS_Store' -delete

clean-bundle:
	@echo "Cleaning bundle..."
	@rm -rf vendor/bundle
	@rm -f Gemfile.lock

update:
	@echo "Updating dependencies..."
	@$(BUNDLE) update

security-check:
	@echo "Checking for security vulnerabilities..."
	@$(BUNDLE) audit check --update

outdated:
	@echo "Checking for outdated dependencies..."
	@$(BUNDLE) outdated

format:
	@echo "Formatter not configured."

update-manifest:
	@echo "Staging new model files..."
	@git add lib/chargebee/models/ lib/chargebee.rb lib/chargebee/result.rb 2>/dev/null || true
	@echo "Updating file manifest in $(GEMSPEC_FILE)..."
	@$(RUBY) -e \
		'files = `git ls-files`.split("\n").sort \
			.reject { |f| f =~ /^\./ } \
			.reject { |f| f =~ /^(rdoc|pkg)/ } \
			.map { |f| "    #{f}" } \
			.join("\n"); \
		spec = File.read("$(GEMSPEC_FILE)"); \
		spec.sub!(/s\.files = %w\[.*?\]/m, "s.files = %w[\n#{files}\n  ]"); \
		File.write("$(GEMSPEC_FILE)", spec)'
	@echo "Manifest updated."