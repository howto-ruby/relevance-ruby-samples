class QuotesController < ApplicationController
  skip_before_filter :login_required, :login_from_cookie
  around_filter :log_details
  
  # GET /quotes
  # GET /quotes.xml
  def index
    @quotes = Quote.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quotes }
    end
  end

  # GET /quotes/1
  # GET /quotes/1.xml
  def show
    @quote = Quote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quote }
    end
  end

  # GET /quotes/new
  # GET /quotes/new.xml
  def new
    @quote = Quote.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @quote }
    end
  end

  # GET /quotes/1/edit
  def edit
    @quote = Quote.find(params[:id])
  end

  # POST /quotes
  # POST /quotes.xml
  def create
    @quote = Quote.new(params[:quote])

    respond_to do |format|
      if @quote.save
        flash[:notice] = 'Quote was successfully created.'
        format.html { redirect_to(@quote) }
        format.xml  { render :xml => @quote, :status => :created, :location => @quote }
      else
        format.html { render :template => "new" }
        format.xml  { render :xml => @quote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /quotes/1
  # PUT /quotes/1.xml
  def update
    @quote = Quote.find(params[:id])

    respond_to do |format|
      if @quote.update_attributes(params[:quote])
        flash[:notice] = 'Quote was successfully updated.'
        format.html { redirect_to(@quote) }
        format.xml  { head :ok }
      else
        format.html { render :template => "edit" }
        format.xml  { render :xml => @quote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.xml
  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to(quotes_url) }
      format.xml  { head :ok }
    end
  end

  # codecite around_filter
  private 
  def log_details
    yield
    sep  = "*" * 72
    logger.info(<<-END)
#{sep}    
#{request.method} #{request.request_uri}    
#{request.raw_post}    
#{sep}
#{response.body}    
#{sep}    
END
  end
  # codecite around_filter

end
