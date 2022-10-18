# Assessment Checker

In order to find out if your machine will run the first few App Academy
assessments, please follow these steps:

1. [Download and unzip this file][gemfile-raw]
2. Navigate to the directory where you unzipped the file:

    ```sh
    ~$ cd ~/Downloads/assessments-checker
    ```

3. Run the following code:

    ```sh
    ~$ ruby -v
    ~$ gem install bundler
    ~$ bundle install
    ```

[gemfile-raw]: https://assets.aaonline.io/fullstack/meta/first-day-instructions/assessment-checker.zip

Your Ruby version should be 2.5.1 (the exact release number doesn't
matter as much). If the `bundle install` succeeds, you're good to go:
you have the correct Ruby and gem versions installed, and can bring your
computer into the office to take the assessment. If you hit any snags,
refer back to the [Ruby setup instructions][ruby-setup] and try
searching Google for the error message.  Accessing this on GitHub? Use [this link][github-ruby-setup]. If all else fails, you'll be
welcome to use one of the school machines for the assessment. :)

[ruby-setup]: setting-up-a-development-environment--phase-1-
[github-ruby-setup]: https://github.com/appacademy/curriculum/blob/master/course/readings/dev-setup.md
