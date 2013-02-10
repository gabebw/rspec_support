# RspecSupport

A helpful collection of bits and bobs.

## Usage

* `define_class`, so you can define per-scenario classes without leaking into
  the global namespace:

        it 'uses a local class' do
          define_constant(MyClass) do
            # Everything in this block is class-evaled. The block is optional.
            def hello
              "hello"
            end
          end

          expect(MyClass.new.hello).to eq "hello"
        end

        it 'is not available everywhere' do
          expect { MyClass.new }.to raise_error(NameError, /uninitialized constant/)
        end

## Installation

Add this line to your application's Gemfile:

    gem 'rspec_support'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec_support

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
